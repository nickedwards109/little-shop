Rails.application.routes.draw do
  root 'items#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#home'

    resources :items, only: [:index, :edit, :update, :new, :create]
    resources :orders, only: [:show]

    get '/change', to: 'dashboard#change'
  end

  scope module: 'users' do
    get '/dashboard', to: 'dashboard#home'
    resources :orders, only: [:index, :show, :create]
  end

  resources :categories, only: [:index, :show] do
    resources :items, only: [:show], module: "categories"
  end

  resources :users, only: [:new, :create, :edit, :update] do
    resources :addresses
  end
  
  resources :items, only: [:index, :show]

  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'
  delete '/cart', to: 'carts#destroy'
  patch '/cart_decrement', to: 'carts#decrement'
  patch '/cart_increment', to: 'carts#increment'
  get '/checkout', to: 'users/orders#checkout'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
