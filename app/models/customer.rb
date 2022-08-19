class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :postal_code,     presence: true
  validates :prefecture_code, presence: true
  validates :city,            presence: true
  validates :street,          presence: true
  
  has_many :orders            , dependent: :destroy
  has_many :contacts          , dependent: :destroy
  has_many :cart_items        , dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  
  ## フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end
  
  ## フルアドレス(郵便番号 以外)
  def full_address
    self.prefecture_code + self.city + self.street + self.other_address
  end
  
end
