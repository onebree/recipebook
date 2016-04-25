Rails.application.routes.draw do
  root "home#index"

  resources :recipes, only: [:new, :create, :edit, :update, :destroy, :show]
end
