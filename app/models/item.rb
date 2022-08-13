class Item < ApplicationRecord
    
    # 8/12
    has_one_attached :image
    # 8/13
    belongs_to :item_genre
    
end
