class CryptoAddress < ApplicationRecord
  belongs_to :user

  # enum crypto_type: { bitcoin: "bitcoin", dogecoin: "dogecoin" }
  # enum address_purpose: { generated: "generated", cashout: "cashout" }

  validates :address, presence: true, uniqueness: { scope: [ :crypto_type, :address_purpose ] }
end
