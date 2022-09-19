class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.all.where(customer_id: current_customer.id)
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:select_address] == '0'
      @order.get_shipping_informations_from(current_customer)
    elsif params[:select_address] == '1'
      @shipping_address = ShippingAddress.find(params[:adress_id])
      @order.get_shipping_informations_from(@shipping_address)
    elsif params[:select_address] == '2'
      # 新規入力
    end
  end
  ## 自作メソッド
  # get_shipping_informations_from(resource)：配送先情報を代入する
  
  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    CartItem.where(customer_id: current_customer.id).destroy_all
    redirect_to complete_orders_path
  end
  
  def complete
  end

  def index
    @orders = Order.all.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_of_total, :payment_method, :order_status)
  end
  
end