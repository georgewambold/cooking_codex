class RecipesController < ApplicationController
  before_action :authenticate_cook!, only: [:new, :create, :update, :edit]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params.merge(cook: current_cook))

    if @recipe.errors.empty?
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    recipe = Recipe
      .includes(:directions, recipe_ingredients: :ingredient)
      .find(params[:id])

    @recipe = RecipeShowDecorator.decorate(recipe)
  end

  def index
    @recipes = RecipeIndexDecorator.decorate_collection(Recipe.all)
  end

  def update
    @recipe = RecipeUpdater.new(recipe: Recipe.find(params[:id]), recipe_params: recipe_params).execute

    if @recipe.errors.empty?
      redirect_to @recipe
    else
      render :edit
    end
  end

  def edit
    recipe = Recipe.find(params[:id])
    @recipe = RecipeEditDecorator.decorate(recipe)
  end

  private

  def recipe_params
    params.require(:recipe)
      .permit(
        :title,
        :recipe_category_id,
        :summary,
        :yield,
        :prep_time,
        :cooking_time,
        :image,
        recipe_ingredients_attributes: [ :amount, ingredient_attributes: [ :name ] ],
        directions_attributes: [ :step_number, :description ],
    )
  end
end
