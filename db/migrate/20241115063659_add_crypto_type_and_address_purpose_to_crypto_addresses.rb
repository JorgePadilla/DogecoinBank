class AddCryptoTypeAndAddressPurposeToCryptoAddresses < ActiveRecord::Migration[8.0]
  def change
    add_column :crypto_addresses, :crypto_type, :string
    add_column :crypto_addresses, :address_purpose, :string
  end
end
