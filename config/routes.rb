Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

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
    end
  end
  # devise_for :users
  # root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'mypage/identification' => 'items#show'
end

