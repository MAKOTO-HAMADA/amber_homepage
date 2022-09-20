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
    # Orderテーブルの保存
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    # OrderHistoryテーブルを同時保存（商品情報を引っ張り出すテーブル）
    # <カート>の内容を、<注文履歴>に置き換える each文
    current_customer.cart_items.each do |cart|
      order_history = OrderHistory.new
      order_history.order_id = order.id
      order_history.item_id = cart.item.id
      order_history.quantity_by_type = cart.quantity_by_type
      order_history.save
    end
    # <カート>の内容を全削除
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