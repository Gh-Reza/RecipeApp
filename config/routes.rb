Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :foods
  resources :recipe_foods
  resources :recipes do
    collection do
      get 'public_recipes'
    end
    member do
      patch :update_public
    end
  end
  resources :users
end
