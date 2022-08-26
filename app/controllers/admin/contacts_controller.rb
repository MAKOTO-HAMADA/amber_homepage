class Admin::ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
    @customer = Customer.find(@contact.customer_id)
  end
  
end
