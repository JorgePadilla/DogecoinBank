DogecoinClient.configure do |config|
  config.host = "localhost"
  config.port = 22555
  config.protocol = :http
  config.user = Rails.application.credentials.dig(:dogecoin, :user)
  config.password = Rails.application.credentials.dig(:dogecoin, :password)
end
