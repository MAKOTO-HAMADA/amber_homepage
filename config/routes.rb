Rails.application.routes.draw do
  
  namespace :public do
    get 'item_genres/show'
  end
  ## デフォルト... 8/10
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  # devise_for :admins      自動生成... 8/10
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do   # アドミンルーティング... 8/12
    get '' => 'homes#top'
    resources :orders,          only: [:show, :update] do
      resources :order_histories, only: [:update]
    end
    resources :contacts,        only: [:index, :show, :destroy]
    resources :contact_genres,  only: [:index, :create, :edit, :update, :destroy]
    resources :customers,       only: [:index, :show, :edit, :update]
    resources :items
    resources :item_genres,     only: [:index, :create, :edit, :destroy]
    patch 'item_genres/:id/edit' => 'item_genres#update', as: 'edit_item_genre'
  end
  
  # devise_for :customers   自動生成... 8/10
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions:      'public/sessions'
  }
  
  scope module: :public do   # パブリックルーティング... 8/12
    root 'homes#top'
    # 会員
    
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get   'customers/mypage'           => 'customers#show',        as: 'mypage'
    get   'customers/information/edit' => 'customers#edit',        as: 'edit_information'
    patch 'customers/information'      => 'customers#update',      as: 'update_information'
    get   'customers/unsubscribe'      => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    put   'customers/information'      => 'customers#update'
    patch 'customers/withdraw'         => 'customers#withdraw',    as: 'withdraw_customer'
    # 配送
    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
    # 商品
    resources :items,              only: [:index, :show] do
      collection do
        get :search
      end
    end
    # アイテムジャンル
    resources :item_genres, only: [:show]
    
    # カート
    resources :cart_items,         only: [:index, :create, :update, :destroy] do
      collection do
        delete :destroy_all
      end
      # delete(HTTPメソッド)が[destroyアクション]と[destroy_allアクション]の２つで重複する為
      # URLで呼び出す際どちらも[cart_items/:id]で呼び出され[destroyアクション]だけ反応するようになる
      # その為[collectionメソッド]でdestroy_allの方を個別で指定する... 8/16
    end
    # 注文
    resources :orders,             only: [:new, :index, :create, :show] do
      collection do
        get :complete
      end
    end
    post 'orders/confirm' => 'orders#confirm'
    # 問合せ
    resources :contacts,           only: [:new, :create]
    post 'contacts/confirm' => 'contacts#confirm'
    get 'contacts/complete' => 'contacts#complete'
  end
  
end
