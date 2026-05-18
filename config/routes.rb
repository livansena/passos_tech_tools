Rails.application.routes.draw do
  resource :cart, only: [:show]

  resources :cart_items, only: [:create, :destroy]
  resources :products, only: [:index, :show]

  root "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end