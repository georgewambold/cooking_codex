class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

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
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
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
