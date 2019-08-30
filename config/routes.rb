Rails.application.routes.draw do

  root to: 'items#top'
  root to: 'details#index'

  root to: 'items#index'

  
  namespace :mypage do
    get 'profile/'       => 'users#show'
    get 'card/'          => 'users#card'
    get 'card/create/'   => 'users#create'
    get 'card/destroy/'  => 'users#destroy'
    get 'identification' => 'users#identification'
    get 'logout'         => 'users#logout'
    get '/'              => 'users#mypage'
  end

  resources :users do
  end

  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

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
      get 'sell'         => 'items#sell'
      get :purchase
      get 'items/show/' => 'items#show'
      get 'itemes/top/' => 'items#top'
    end
  end
end