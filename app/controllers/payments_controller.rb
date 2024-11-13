class PaymentsController < ApplicationController
  before_action :require_authentication
  def new
  end

  def create
    # This action will handle the form submission and process the payment
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Dogecoin Purchase",
      currency: "usd"
    )

    # Handle successful payment logic here
    redirect_to root_path, notice: "Payment successful!"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end
end
