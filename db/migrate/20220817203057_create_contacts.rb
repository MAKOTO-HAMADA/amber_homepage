class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      
    t.integer :customer_id, null: false
    t.integer :genre_id,    null: false
    t.string  :name,        null: false
    t.string  :email,       null: false
    t.text    :inquiry,     null: false

      t.timestamps
    end
  end
end
