Rails.application.routes.draw do

  devise_for :cooks

  resources :recipe, only: [:new, :index, :show, :edit, :create, :update]
end

