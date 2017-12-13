class RecipesController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    @recipes = RecipeIndexDecorator.decorate_collection(Recipe.all)
  end

  def update
  end

  def edit
  end
end
