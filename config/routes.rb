Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'user/registrations'
  }

  scope :jp do
    scope :mypage do
      get 'profile'        => 'users#show'
      get 'identification' => 'users#identification'
      get 'logout'         => 'users#logout'
      get '/'              => 'users#mypage' ,as: "mypage"
      resources :cards, only: [:new, :show] do
        collection do
          post 'show'      => 'cards#show'
          post 'pay'       => 'cards#pay'
          post 'delete'    => 'cards#delete'
          get  'add'       => 'cards#add'
          get 'index'      => 'cards#index'
          post 'paypay'    => 'cards#paypay'
        end
      end
    end

    scope :transaction do
      scope :buy do
        get 'm[:id]/sell'  => 'items#transaction'
      end
    end
    resources :item_images, only: [:create,:destroy,:update], defaults: { format: 'json' }
      #画像用のルート
    resources :items, only: [:index, :show, :new, :edit, :destroy] do
      #Ajaxで動くアクションのルートを作成
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
        get 'get_size', defaults: { format: 'json' }
      end    
    end
    # get 'm[:id]/detail'    => 'items#show'
    get 'sell'             => 'items#new'
    get '/'                => 'items#index' ,as: "root"
  end

  devise_scope :user do
    scope :jp do
      scope :signup do
        get '/'                    => 'users/registrations#new'
        get 'registration'         => 'users/registrations#step1'
        get 'ms_confirmation'      => 'users/registrations#step2'
        get 'sms_confirmation/sms' => 'users/registrations#step3'
        get 'address'              => 'users/registrations#step4'
        get 'credit'               => 'users/registrations#step5'
        post 'registration/create' => 'users/registrations#create'
      end
      get 'users/sign_out'         => 'users#destroy'
    end
  end

  resources :users ,only: [:new,:create] do
  end
end