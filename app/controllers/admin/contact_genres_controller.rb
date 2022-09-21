class Admin::ContactGenresController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @contact_genre = ContactGenre.new
    @contact_genres = ContactGenre.all
  end
  
  def create
    @contact_genre = ContactGenre.new(contact_genre_params)
    if @contact_genre.save
      redirect_to admin_contact_genres_path
    else
      @contact_genres = ContactGenre.all
      render :index
    end
  end

  def edit
    @contact_genre = ContactGenre.find(params[:id])
  end
  
  def update
    @contact_genre = ContactGenre.find(params[:id])
    if @contact_genre.update(contact_genre_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to admin_contact_genres_path
    else
      render :edit
    end
  end
  
  private
  
  def contact_genre_params
    params.require(:contact_genre).permit(:name)
  end
  
end
