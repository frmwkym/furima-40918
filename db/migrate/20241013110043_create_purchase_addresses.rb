class CreatePurchaseAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_addresses do |t|

      t.timestamps
    end
  end
end
