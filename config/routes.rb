Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :foods
  resources :recipes do
    member do
      patch :update_public
    end
  end
  resources :users
end
