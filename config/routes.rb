Rails.application.routes.draw do
  root to: 'items#top'
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
      scope :card do
        get '/'            => 'cards#edit'
        get 'create'       => 'cards#new'
        delete 'destroy'   => 'cards#destroy'
        get 'edit'         => 'cards#show'
      end
    end
    scope :transaction do
      scope :buy do
        get 'm[:id]/sell'  => 'items#transaction'
      end
    end

    resources :items, only: [:index, :show, :new, :edit, :destroy] do
      #Ajaxで動くアクションのルートを作成
      collection do
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
        # get 'get<div class="code-title" data-title="Gemfile">_category_grandchildren', defaults: { format: 'json' }
      end    
    end
    # get 'm[:id]/detail'    => 'items#show'
    get 'sell'             => 'items#new'
    # post 'sell'            => 'items#create'
    # get '/'                => 'items#index'
    # get 'purchase'         => 'items#purchase'
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