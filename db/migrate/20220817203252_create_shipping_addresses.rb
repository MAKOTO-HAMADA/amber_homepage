class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      
      t.integer :customer_id     , null: false
      t.string :postal_code      , null: false
      t.string :address          , null: false
      t.string :name             , null: false
      t.string :telephone_number , null: false
      t.string :email            , null: false
      
      t.timestamps
    end
  end
end
