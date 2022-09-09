class Public::ShippingAddressesController < ApplicationController
  
  def index
    @shipping_addresses = ShippingAddress.all
    @shipping_address = ShippingAddress.new
  end
  
  def create
    @shipping_address = ShippingAddress.new(shippingaddress_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_address.save
    redirect_to shipping_addresses_path
  end

  def edit
  end
  
  def updated
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