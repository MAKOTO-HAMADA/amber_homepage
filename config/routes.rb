Rails.application.routes.draw do
  
  ## デフォルト... 8/10
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  ## 自動生成されたもの
  # devise_for :customers   自動生成
  # devise_for :admins      自動生成
  
  root to: 'public/homes#top'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    # get '' => 'homes#top'
    get 'top' => 'homes#top'
    get 'orders/show'
    get 'contact_genres/index'
    get 'contact_genres/edit'
    get 'contacts/index'
    get 'contacts/show'
    get 'costomers/index'
    get 'costomers/show'
    get 'costomers/edit'
    get 'items_genres/index'
    get 'items_genres/edit'
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
    get 'contacts/new'
    get 'contacts/complete'
    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    get 'customer/show'
    get 'customer/edit'
    get 'customer/unsubscribe'
    get 'items/index'
    get 'items/show'
  end
  
end
