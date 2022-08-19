class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|

      t.timestamps
    end
  end
end
