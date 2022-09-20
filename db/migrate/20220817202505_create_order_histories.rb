class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|
      
      t.references :order,            null: false
      t.references :item,             null: false
      t.integer    :quantity_by_type, null: false

      t.timestamps
    end
  end
end
