class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
    @item_genres = ItemGenre.all.map {|genre| [genre.name, genre.id]}
    # map：ブロック変数（genre）にレコード内の
    # genre.nameとgenre.idを取り出して代入している
  end
  
  def index
    @items = Item.all
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      @item_genres = ItemGenre.all.map {|genre| [genre.name, genre.id]}
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @item_genres = ItemGenre.all.map {|genre| [genre.name, genre.id]}
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "編集を完了しました。"
      redirect_to admin_item_path(@item.id)
    else
      @item_genres = ItemGenre.all.map {|genre| [genre.name, genre.id]}
      render :edit
    end
  end
  
  private
  
  # 8/12
  def item_params
    params.require(:item).permit(:item_genre_id, :image, :name, :introduction, :price, :quantity_of_sales, :sales_status)
  end
  
end
