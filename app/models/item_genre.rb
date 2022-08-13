class ItemGenre < ApplicationRecord
    
    # 8/13
    has_many :items, dependent: :destroy
    
end
