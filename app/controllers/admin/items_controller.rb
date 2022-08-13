class Admin::ItemsController < ApplicationController
  
  # 8/12
  def new
    @item = Item.new
    # map：ブロック変数（genre）にレコード内の
    # genre.nameとgenre.idを取り出して代入している
    @item_genres = ItemGenre.all.map {|genre| [genre.name, genre.id]}
  end
  
  # 8/12
  def index
    @items = Item.all
  end
  
  # 8/12
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
  end

  def edit
  end
  
  private
  
  # 8/12
  def item_params
    params.require(:item).permit(:item_genre_id, :name, :introduction, :price, :quantity_of_sales, :sales_status)
  end
  
end
