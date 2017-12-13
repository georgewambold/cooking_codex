Rails.application.routes.draw do
  devise_for :cooks

  root to: 'recipes#index'

  resources :recipes, only: [:new, :index, :show, :edit, :create, :update]
end

