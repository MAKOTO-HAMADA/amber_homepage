class Admin::ContactGenresController < ApplicationController
  
  def index
    @contact_genre = ContactGenre.new
    @contact_genres = ContactGenre.all
  end
  
  def create
    @contact_genre = ContactGenre.new(contact_genre_params)
    @contact_genre.save
    redirect_to admin_contact_genres_path
  end

  def edit
    @contact_genre = ContactGenre.find(params[:id])
  end
  
  def update
    @contact_genre = ContactGenre.find(params[:id])
    @contact_genre.update(contact_genre_params)
    redirect_to admin_contact_genres_path
  end
  
  private
  
  def contact_genre_params
    params.require(:contact_genre).permit(:name)
  end
  
end
