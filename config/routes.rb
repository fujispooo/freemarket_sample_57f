Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  root to: 'items#index'
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

  scope :jp do
    scope :mypage do
      get 'profile'        => 'users#show'
      get 'identification' => 'users#identification'
      get 'logout'         => 'users#logout'
      get '/'              => 'users#mypage'
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
    get 'm[:id]/detail'    => 'items#show'
    get 'sell'             => 'items#new'
    get '/'                => 'items#index'
  end

  devise_scope :user do
    scope :jp do
      scope :signup do
        get '/'                    => 'users/registrations#index'
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