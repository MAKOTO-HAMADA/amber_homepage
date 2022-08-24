class Admin::ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
  end

  def show
    
  end
  
end
