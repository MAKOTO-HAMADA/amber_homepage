class Contact < ApplicationRecord
    
    belongs_to :customer
    belongs_to :contact_genre
    
    validates :name,    presence: true
    validates :email,   presence: true
    validates :inquiry, presence: true
    
end
