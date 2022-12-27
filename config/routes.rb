Rails.application.routes.draw do
  devise_for :users
  root to: "trips#index"
  resources :trips, only: [:show] do
    resources :lodgings, only: [:new, :create]
    resources :transits, only: [:new, :create]
    resources :rentals, only: [:new, :create]
    resources :places, only: [:new, :create]
    resources :expenses, only: [:new, :create]

    member do
      get :map
      get :details
      get :overview
      get :itinerary
      get :budget
    end
  end
  resources :lodgings, only: :delete
end
