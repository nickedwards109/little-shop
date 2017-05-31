Rails.application.routes.draw do
  root 'items#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#home'
  end
  
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  
  get '/dashboard', to: 'sessions#dashboard'
end
