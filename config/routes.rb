Rails.application.routes.draw do
  root to: 'items#top'
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

  namespace :jp do
    namespace :mypage do
      get 'profile'        => 'users#show'
      get 'identification' => 'users#identification'
      get 'logout'         => 'users#logout'
      get '/'              => 'users#mypage'
      namespace :card do
        get '/'            => 'users#show'
        get 'create'       => 'users#new'
        delete 'destroy'   => 'users#destroy'
        get 'edit'         => 'users#edit'
      end
    end
    namespace :transaction do
      namespace :buy do
        get 'm[:id]/sell'  => 'items#show'
      end
    end
    get 'm[:id]/detail'    => 'items#show'
    get 'sell'             => 'items#new'
    get '/'                => 'items#index'
    get 'purchase'         => 'items#purchase'
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