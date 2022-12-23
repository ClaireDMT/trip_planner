Rails.application.routes.draw do
  devise_for :users
  root to: "trips#index"
  resources :trips do
    resources :lodgings, only: [:new, :create]
  end
  resources :lodgings, only: :delete
end
