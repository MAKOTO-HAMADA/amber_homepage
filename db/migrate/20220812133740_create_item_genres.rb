class CreateItemGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :item_genres do |t|
      
      # 8/14
      t.string  :name,         null: false
      t.text    :introduction
      
      t.timestamps
    end
  end
end
