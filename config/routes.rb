Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  get '/foods', to: 'foods#index', as: 'user_root'
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
  root "foods#index"
end
