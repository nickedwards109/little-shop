Rails.application.routes.draw do
  root 'items#index'

  resources :items, only: [:index, :show]
  resources :categories, only: [:index, :show] do
    resources :items, only: [:show], module: "categories"
  end

  resources :carts, only: [:create]
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  get '/dashboard', to: 'sessions#dashboard'
end
