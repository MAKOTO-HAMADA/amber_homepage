class Public::ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
    @contact_genres = ContactGenre.all.map {|genre| [genre.name, genre.id]}
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    @contact_genre = ContactGenre.find(@contact.contact_genre_id)
  end
  
  def create
    contact = Contact.new(contact_params)
    contact.customer_id = current_customer.id
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