class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|

      t.timestamps
    end
  end
end
