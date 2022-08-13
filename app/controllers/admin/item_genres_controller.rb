class Admin::ItemGenresController < ApplicationController
  
  def index
    @item_genre  = ItemGenre.new
    @item_genres = ItemGenre.all
  end
  
  def create
    @item_genre = ItemGenre.new(item_genre_params)
    @item_genre.save
    redirect_to admin_item_genres_path
  end

  def edit
  end
  
  private
  
  def item_genre_params
    params.require(:item_genre).permit(:name, :introduction)
  end
  
end
