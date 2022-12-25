Rails.application.routes.draw do
  devise_for :users
  root to: "trips#index"
  resources :trips, only: [:show] do
    resources :lodgings, only: [:new, :create]
    resources :transits, only: [:new, :create]

    member do
      get :map
      get :details
    end
  end
  resources :lodgings, only: :delete
end
