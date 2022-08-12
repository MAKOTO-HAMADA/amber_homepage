Rails.application.routes.draw do
  
  ## デフォルト... 8/10
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  # devise_for :admins      自動生成... 8/10
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do   # アドミンルーティング... 8/12
    get '' => 'homes#top'
    resources :orders,          only: [:show, :update] do
      resources :order_details, only: [:update]
    end
    resources :contact_genres,  only: [:index, :create, :edit, :update]
    resources :contacts,        only: [:index, :show]
    resources :customers,       only: [:index, :show, :edit, :update]
    resources :items_genres,    only: [:index, :create, :edit, :update]
    resources :items,           except: [:destroy]
  end
  
  # devise_for :customers   自動生成... 8/10
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do   # パブリックルーティング... 8/12
    root 'homes#top'
    
    # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    put 'customers/information' => 'customers#update'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    
    resources :shipping_addresses,  only: [:index, :edit, :create, :update, :destroy]
    
    resources :items, only: [:index, :show]
    
    resources :cart_items,          only: [:index, :create, :update, :destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    
    resources :orders, only: [:new, :index, :create, :show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete', as: 'complete'
  end
  
end
