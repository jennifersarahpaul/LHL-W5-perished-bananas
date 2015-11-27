Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :sessions, only: [:new, :create, :destroy]
  
  root to: 'movies#index'

end