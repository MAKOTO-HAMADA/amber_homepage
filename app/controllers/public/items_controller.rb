class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all.where(sales_status: true)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def search
    
  end
  
end
