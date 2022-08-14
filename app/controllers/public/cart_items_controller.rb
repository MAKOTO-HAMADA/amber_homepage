class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
  end
  
  def create
    binding.pry
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end
  
  def update
    binding.pry
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity_by_type)
  end
  
end
