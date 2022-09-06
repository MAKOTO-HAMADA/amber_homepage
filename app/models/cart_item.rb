class CartItem < ApplicationRecord
    
    belongs_to :item
    belongs_to :customer
    
    def subtotal
        self.item.add_tax_price * self.quantity_by_type 
    end
    
end