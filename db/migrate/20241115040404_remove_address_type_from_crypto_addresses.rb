class RemoveAddressTypeFromCryptoAddresses < ActiveRecord::Migration[8.0]
  def change
    remove_column :crypto_addresses, :address_type, :string
  end
end
