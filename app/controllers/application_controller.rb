class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # deviseの機能が使われる前に：c〇〇メソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefecture_code, :city, :street, :other_address, :address, :telephone_number, :unsubscribe_flag])
  end
  
  private
  
  def set_search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end
  
end
