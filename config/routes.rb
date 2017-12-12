Rails.application.routes.draw do
  devise_for :cooks

  resources :recipes, only: [:new, :index, :show, :edit, :create, :update]
end

