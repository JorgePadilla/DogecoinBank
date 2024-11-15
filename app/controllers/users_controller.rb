class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      # Generate a Dogecoin address for the user
      dogecoin_address = generate_dogecoin_address

      # Create a new CryptoAddress record
      @user.crypto_addresses.create!(
        crypto_type: :dogecoin,
        address: dogecoin_address,
        address_purpose: :generated
      )
      session[:user_id] = @user.id  # Log the user in after sign-up
      redirect_to root_path, notice: "Welcome to DogeBank!"
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  private

  def generate_dogecoin_address
    # Assuming you have a configured DogecoinClient instance
    client = DogecoinClient.new

    # Generate a new Dogecoin address
    new_address = client.get_new_address

    # Return the generated address
    new_address
  rescue StandardError => e
    # Handle any errors that occur during address generation
    Rails.logger.error("Failed to generate Dogecoin address: #{e.message}")
    nil
  end

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
