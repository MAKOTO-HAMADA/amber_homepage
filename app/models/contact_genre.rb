class ContactGenre < ApplicationRecord
    
    has_many :contacts, dependent: :destroy
    
end
