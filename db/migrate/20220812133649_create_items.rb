class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.references :item_genre # .referencesテーブル名　=> 自動生成
      t.string  :name,         null: false
      t.text    :introduction, null: false
      t.integer :price,        null: false
      t.integer :quantity_of_sales
      t.boolean :sales_status, null: false, default: true
      
      t.timestamps
    end
  end
end
