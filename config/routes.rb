Rails.application.routes.draw do
  root 'items#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#home'

    resources :items, only: [:index, :edit, :update, :new, :create]
    resources :orders, only: [:show]

    get '/markpaid', to: 'dashboard#paid'
    get '/markcompleted', to: 'dashboard#completed'
    get '/markcancel', to: 'dashboard#cancel'
  end

  scope module: 'users' do
    get '/dashboard', to: 'dashboard#home'
    resources :orders, only: [:index, :show]
  end

  resources :categories, only: [:index, :show] do
    resources :items, only: [:show], module: "categories"
  end

  resources :users, only: [:new, :create, :edit, :update] do
    resources :addresses
  end

  resources :items, only: [:index, :show]

  resources :carts, only: [:create]

  resources :charges

  get '/cart', to: 'carts#show'
  delete '/cart', to: 'carts#destroy'
  put '/cart', to: 'carts#update'
  get '/checkout', to: 'users/orders#checkout'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
