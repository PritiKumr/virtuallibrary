Rails.application.routes.draw do
  resources :subscribers, only: [:create, :new]
  resources :user_infos
  resources :publications
  resources :authors
  resources :carts
  resources :plans
  devise_for :users
  root to: 'books#home'
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
  # get "/books/:book_id/book_catalogs/new" => "book_catalogs#new", :as => 'new_book_catalog'
  # post "/books/:book_id/book_catalogs" =>	"book_catalogs#create", :as => 'create_book_catalog'
  post "/books/:id/check_pincode" => "books#check_pincode", :as => 'check_pincode'
  get  "/" => "books#home", :as => 'home'

end
