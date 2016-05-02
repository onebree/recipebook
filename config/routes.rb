Rails.application.routes.draw do
  root "home#index"
  
  match "/", to: "home#index", via: [:get, :post]

  resources :recipes,    only: [:new, :create, :edit, :update, :destroy, :show]
  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  resources :users,      only: [:index]

  get "/recipes/:id/restore" => "recipes#restore", as: :restore_recipe
  get "/search" => "home#search", as: :search
  get "/signup" => "users#new",   as: :signup
end
