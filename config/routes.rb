Rails.application.routes.draw do
  root "home#index"
  
  match "/", to: "home#index", via: [:get, :post]

  resources :recipes,    only: [:new, :create, :edit, :update, :destroy, :show]
  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
end
