class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.references :customer,      null: false
      t.string :postal_code,       null: false
      t.string :address,      null: false
      t.string :name,         null: false
      t.integer :postage,         null: false
      t.integer :payment_of_total, null: false, default: 0
      t.integer :payment_method,   null: false
      t.integer :order_status,     null: false, default: 0
      
      t.timestamps
    end
  end
end
