Rails.application.routes.draw do
  devise_for :users
  root to: "trips#index"
  resources :trips, only: [:show] do
    resources :lodgings, only: %i[new create]
    resources :transits, only: %i[new create]
    resources :rentals, only: %i[new create]
    resources :places, only: %i[new create]
    resources :expenses, only: %i[index new create]

    member do
      get :map
      get :details
      get :overview
      get :itinerary
      get :budget
    end
  end
  resources :expenses, only: %i[edit update]
  resources :lodgings, only: :delete
end
