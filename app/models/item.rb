class Item < ApplicationRecord
    
    has_one_attached :image
    
    belongs_to :item_genre
    has_many :cart_items, dependent: :destroy
    has_many :order_histories, dependent: :destroy
    
    def add_tax_price
        (self.price * 1.10).round
    end
    
    validates :name,         presence: true
    validates :introduction, presence: true
    validates :price,        presence: true

end
