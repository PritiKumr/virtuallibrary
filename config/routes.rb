Rails.application.routes.draw do
  resources :user_infos
  resources :publications
  resources :authors
  resources :carts
  resources :plans
  devise_for :users
  root to: 'books#index'
  resources :books do
    resources :carts
  end
  resources :carts do
    resources :orders, except: [:index, :show, :edit]
  end
  resources :orders, only: [:index, :show, :edit]
  resources :plans
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
