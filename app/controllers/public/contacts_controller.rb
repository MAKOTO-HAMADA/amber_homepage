class Public::ContactsController < ApplicationController
  
  before_action :authenticate_customer!
  
  def new
    @contact = Contact.new
    @contact_genres = ContactGenre.all.map {|genre| [genre.name, genre.id]}
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    @contact_genre = ContactGenre.find(@contact.contact_genre_id)
    if @contact.invalid?
      @contact_genres = ContactGenre.all.map {|genre| [genre.name, genre.id]}
      render :new
    end
  end
  
  def create
    contact = Contact.new(contact_params)
    contact.score = Language.get_data(contact_params[:inquiry]) # NaturalLanguageAPIを使用
    contact.save
    redirect_to contacts_complete_path
  end
  
  def complete
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:customer_id, :contact_genre_id, :name, :email, :inquiry)
  end
  
end