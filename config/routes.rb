Rails.application.routes.draw do
  root 'items#index'

  resources :items, only: [:index, :show]
  resources :categories, only: [:index, :show] do
    resources :items, only: [:show], module: "categories"
  end

  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'
  delete '/cart', to: 'carts#destroy'
  patch '/cart_decrement', to: 'carts#decrement'
  patch '/cart_increment', to: 'carts#increment'

  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  get '/dashboard', to: 'sessions#dashboard'
end
