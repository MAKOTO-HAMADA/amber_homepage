class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      
    t.references :customer, null: false
    t.references :contact_genre,    null: false
    t.string     :name,        null: false
    t.string     :email,       null: false
    t.text       :inquiry,     null: false

      t.timestamps
    end
  end
end
