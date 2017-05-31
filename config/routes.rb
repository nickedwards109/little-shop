Rails.application.routes.draw do
  root 'items#index'

  resources :items, only: [:index, :show]

  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'

  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  get '/dashboard', to: 'sessions#dashboard'
end
