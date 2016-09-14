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
    resources :book_catalogs
  end
  resources :carts do
    resources :orders, except: [:index, :show, :edit]
  end
  resources :orders, only: [:index, :show, :edit]
  resources :plans

  post "/plans/:sub_plan_id/select_plan" => "plans#select_plan", :as => 'select_plan'
  post "/plans/:sub_plan_id/change_plan" => "plans#change_plan", :as => 'change_plan'

  post "/books/:id/check_pincode" => "books#check_pincode", :as => 'check_pincode'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
