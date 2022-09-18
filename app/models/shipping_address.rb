class ShippingAddress < ApplicationRecord
    
    belongs_to :customer
    
    validates :postal_code,      presence: true, length: { is: 7 }
    validates :address,          presence: true
    validates :name,             presence: true
    validates :telephone_number, presence: true
    validates :email,            presence: true
    
end
