Rails.application.routes.draw do
  root "home#index"

  resources :recipes, only: [:new, :create, :edit, :update, :destroy, :show]

  match "/", to: "home#index", via: [:get, :post]
end
