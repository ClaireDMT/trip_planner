Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  resources :trips, only: %i[show index new create] do
    resources :lodgings, only: %i[new create]
    resources :transits, only: %i[new create]
    resources :rentals, only: %i[new create]
    resources :places, only: %i[new create]
    resources :expenses, only: %i[index new create]
    resources :items, only: %i[index new create]

    member do
      get :map
      get :details
      get :overview
      get :itinerary
      get :budget
    end
  end
  resources :expenses, only: %i[edit update delete]
  resources :lodgings, only: %i[edit update delete]
  resources :transits, only: %i[edit update delete]
  resources :rentals, only: %i[edit update delete]
  resources :items, only: %i[edit update delete] do
    member do
      get :toggle_packed
    end
  end
end
