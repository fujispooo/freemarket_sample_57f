Rails.application.routes.draw do
  root to: 'items#index'

  resources :items do
  end
  # devise_for :users
  # root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
