Rails.application.routes.draw do
  root to: 'items#index'
  root to: 'details#index'
  
  resources :users do
    collection do
      get 'mypage/profile/' => 'users#show'
    end
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
      get :test9
      get 'sell'         => 'items#sell'
      get 'mypage/identification' => 'items#show'
      get 'mypage/logout'         => 'items#logout'
    end
  end
end

