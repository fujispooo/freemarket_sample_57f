Rails.application.routes.draw do
  root to: 'items#top'
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

  namespace :jp do
    namespace :mypage do
      get 'profile/'       => 'users#show'
      get 'identification' => 'users#identification'
      get 'logout'         => 'users#logout'
      get '/'              => 'users#mypage'
      namespace :card do
        get '/'            => 'cards#show'
        get 'create/'      => 'cards#new'
        get 'destroy/'     => 'cards#destroy'
      end
    end
    namespace :signup do
      get '/'              => 'users#new'
    end
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
      get :test7
      get :test8
      get :new
      get 'sell'        => 'items#sell'
      get :purchase
      get 'items/show/' => 'items#show'
      get 'itemes/top/' => 'items#top'
    end
  end
end