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
    namespace :signup do
      get '/'              => 'users#new'
    end
    namespace :transaction do
      namespace :buy do
        get 'm[:id]/sell'       => 'items#show'
      end
    end
    get 'm[:id]/detail'    => 'items#show'
    get 'sell'             => 'items#sell'
    get '/'                => 'items#index'
  end

  resources :users ,only: :new do
  end

  resources :items do
    collection do
      get :test1
      get :test2
      get :test3
      get :test4
      get :test5
      get :test6
      get :test8
      get :purchase
    end
  end
end