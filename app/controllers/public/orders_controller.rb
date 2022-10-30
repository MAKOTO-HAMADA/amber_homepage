class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  before_action :back_to_previous_page
  
  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.all.where(customer_id: current_customer.id)
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # ご自身の住所
    if params[:select_address] == '0'
      @order.get_shipping_informations_from(current_customer)
    # 登録先住所選択
    elsif params[:select_address] == '1'
      @shipping_address = ShippingAddress.find_by(params[:adress_id])
      if @shipping_address == nil
        flash[:notice] = "＜登録済住所＞がない為、＜マイページ＞より登録をお願いします。"
        redirect_back(fallback_location: root_path)
      end
      @order.get_shipping_informations_from(@shipping_address)
    # 新しいお届け先
    elsif params[:select_address] == '2'
      if @order.postal_code.empty? || @order.address.empty? || @order.name.empty?
        flash[:notice] = "＜新しいお届け先＞に記入が足りない箇所があります。"
        redirect_back(fallback_location: root_path)
      end
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
  
  # back_to_previous_page：カートが空の場合order/newへ遷移せずcart/indexに戻すメソッド
  def back_to_previous_page
    x = 0
    cart_items = CartItem.where(customer_id: current_customer.id)
    cart_items.each do |cart_item|
      x += cart_item.quantity_by_type
    end
    if x == 0
      flash[:notice] = "カートの商品を入れてください。"
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_of_total, :payment_method, :order_status)
  end
  
end