class Public::ItemsController < ApplicationController
  
  before_action :redirect_root, except: [:index, :search]
  before_action :set_q, only: [:search]
  
  def index
    @items = Item.all.where(sales_status: true)
    @item_genres = ItemGenre.all
  end

  def show
    @item = Item.find(params[:id])
    @item_genres = ItemGenre.all
    @cart_item = CartItem.new
  end
  
  def search
    @results = @q.result
    @item_genres = ItemGenre.all
  end
  
  private

  def redirect_root
    @item_genres = ItemGenre.all
    render :index unless customer_signed_in?
  end

  def set_q
    @q = Item.ransack(params[:q])
  end
  
end
