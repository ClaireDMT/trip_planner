Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :trips, only: %i[show index new create] do
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
