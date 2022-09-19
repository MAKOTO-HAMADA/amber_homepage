class CartItem < ApplicationRecord
    
    belongs_to :item
    belongs_to :customer
    
    def subtotal
        self.item.add_tax_price * self.quantity_by_type 
    end
    
    validates :quantity_by_type, inclusion: { in: 1..10 }
    
end