Rails.application.routes.draw do
  root to: 'card# method'
  resources :items do
    collection do
      get 'mypage/identification' => 'items#show'
      get 'mypage/logout'         => 'items#logout'
      
    end
  end 

  # devise_for :users
  # root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end

