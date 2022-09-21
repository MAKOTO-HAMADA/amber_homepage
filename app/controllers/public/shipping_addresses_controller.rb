class Public::ShippingAddressesController < ApplicationController
  
  before_action :authenticate_customer!
  
  def index
    @shipping_addresses = ShippingAddress.all
    @shipping_address   = ShippingAddress.new
  end
  
  def create
    @shipping_addresses = ShippingAddress.all
    @shipping_address   = ShippingAddress.new(shippingaddress_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_address.save
    render :index
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end
  
  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shippingaddress_params)
      flash[:notice] = "編集を完了しました。"
      redirect_to shipping_addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    s_address = ShippingAddress.find(params[:id])
    s_address.destroy
    redirect_to shipping_addresses_path
  end
  
  private
  
  def shippingaddress_params
    params.require(:shipping_address).permit(:customer_id, :postal_code, :address, :name, :telephone_number, :email)
  end
  
end