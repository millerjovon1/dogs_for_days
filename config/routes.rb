Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dogs, only: [:index, :show, :new, :create ] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update]

  namespace :owner do
    resources :bookings, only: [:index]
  end
  resources :bookings, only: [:update]

  resources :user, only: [] do
    resources :reviews, only: [:create]
  end



end
