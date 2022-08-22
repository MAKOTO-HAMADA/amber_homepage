class CreateContactGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_genres do |t|
      
      t.string :name, null: false
      
      t.timestamps
    end
  end
end
