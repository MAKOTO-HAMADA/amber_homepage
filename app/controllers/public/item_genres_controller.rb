class Public::ItemGenresController < ApplicationController
  
  def show
    @item_genres = ItemGenre.all
    @item_genre  = ItemGenre.find(params[:id])
  end
  
end
