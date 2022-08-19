class Item < ApplicationRecord
    
    has_one_attached :image
    
    belongs_to :item_genre
    
    has_many :cart_items, dependent: :destroy
    has_many :order_histories, dependent: :destroy
    
end
