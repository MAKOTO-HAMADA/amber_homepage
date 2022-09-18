class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      bypass_sign_in(@customer)
      flash[:notice] = "編集を完了しました。"
      redirect_to mypage_path
    else
      render :edit
    end
  end
  # bypass_sign_in：deviseの使用上、パスワードやメールアドレスを変更すると
  # 自動ログアウトされるのを防ぐ為のコード

  def unsubscribe
    @customer = Customer.find(current_customer.id)
    
  end
  
  def withdraw
    customer = Customer.find(current_customer.id)
    customer.update(unsubscribe_flag: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :postal_code, :prefecture_code, :city, :street, :other_address, :unsubscribe_flag)
  end
  
end
