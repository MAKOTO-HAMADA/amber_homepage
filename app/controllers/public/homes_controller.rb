class Public::HomesController < ApplicationController
  
  def top
  end
  
  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |f|
      f.password = SecureRandom.urlsafe_base64
      f.postal_code      = "XXXXXXX"
      f.telephone_number = "XXXXXXXXXXX"
      f.prefecture_code  = "都道府県"
      f.city             = "市町村"
      f.street           = "番地"
      f.last_name        = "ゲスト"
      f.first_name       = "会員"
      f.last_name_kana   = "ゲスト"
      f.first_name_kana  = "カイイン"
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
end