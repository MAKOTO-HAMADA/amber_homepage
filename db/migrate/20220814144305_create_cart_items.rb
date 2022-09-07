class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      
      t.references :customer,      null: false
      t.references :item,          null: false
      t.integer :quantity_by_type, null: false
    end
  end
end
