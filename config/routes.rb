Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  resources :categories, only: [:index, :show] do
    resources :items, only: [:show], module: "categories"
  end
end
