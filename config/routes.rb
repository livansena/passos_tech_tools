Rails.application.routes.draw do
  get "admin/orders"
  get "orders/confirmation"
  get "checkout", to: "checkout#index"
  post "checkout", to: "checkout#create"
  resource :cart, only: [:show]

  resources :cart_items, only: [:create, :destroy] do
    member do
      patch :increase
      patch :decrease
    end
  end

  resources :products, only: [:index, :show]

  root "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end