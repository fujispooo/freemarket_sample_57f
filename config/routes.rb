Rails.application.routes.draw do

  root to: 'profile#index'
  root to: 'items#index'



  devise_for :users
  root to: 'items#index'
  root to: 'profile#index'
  root to: 'details#index'

  resources :users do
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
      get :test9
      get 'sell'         => 'items#sell'
      get 'mypage/identification' => 'items#show'
      get 'mypage/logout'         => 'items#logout'
    end
  end

end

end

