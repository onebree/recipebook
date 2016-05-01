Rails.application.routes.draw do
  get 'users/new'

  root "home#index"
  
  match "/", to: "home#index", via: [:get, :post]

  resources :recipes,    only: [:new, :create, :edit, :update, :destroy, :show]
  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy, :show]

  get "/recipes/:id/restore" => "recipes#restore", as: :restore_recipe
  get "/search"              => "home#search",     as: :search
end
