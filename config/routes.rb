Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :foods
  resources :recipes
  resources :users
end
