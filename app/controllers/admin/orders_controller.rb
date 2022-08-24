class Admin::OrdersController < ApplicationController
    
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order.id), notice: "ステータスが変更されました。"
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :payment_of_total, :payment_method, :order_status)
  end
  
end
