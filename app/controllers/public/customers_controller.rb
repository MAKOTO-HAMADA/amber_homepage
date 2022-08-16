class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    customer = Customer.find(current_customer.id)
    customer.update(customer_params)
    bypass_sign_in(customer)
    redirect_to mypage_path
  end
  # bypass_sign_in：deviseの使用上、パスワードやメールアドレスを変更すると
  # 自動ログアウトされる

  def unsubscribe
  end
  
  def withdraw
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :postal_code, :prefecture_code, :city, :street, :other_address, :password, :password_confirmation)
  end
  
end
