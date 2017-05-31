Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create]
  
  get '/login', to: 'sessions#new'
end
