Rails.application.routes.draw do
  get 'recipe/new'

  get 'recipe/edit'

  get 'recipe/update'

  get 'recipe/create'

  get 'recipe/show'

  get 'recipe/index'

  devise_for :cooks

  resource :recipe, only: [:new, :index, :show, :edit, :create, :update]
end

