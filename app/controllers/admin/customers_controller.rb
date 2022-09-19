class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      bypass_sign_in(@customer)
      flash[:notice] = "編集を完了しました。"
      redirect_to admin_customer_path
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :postal_code, :prefecture_code, :city, :street, :other_address, :unsubscribe_flag)
  end
  
end
