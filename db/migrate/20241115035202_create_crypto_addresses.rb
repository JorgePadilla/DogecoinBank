class CreateCryptoAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :crypto_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address_type
      t.string :address

      t.timestamps
    end
  end
end
