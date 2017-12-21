class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    #recipe = RecipeCreator.new(recipe_params: recipe_params).execute
    recipe = Recipe.create(recipe_params)

    if recipe.errors.empty?
      redirect_to recipe
    else
      @recipe = recipe
      render :new
    end
  end

  def show
    recipe = Recipe
      .includes(:directions, recipe_ingredients: :ingredient, recipe_images: :image)
      .find(params[:id])

    @recipe = RecipeShowDecorator.decorate(recipe)
  end

  def index
    @recipes = RecipeIndexDecorator.decorate_collection(Recipe.includes(:primary_photo).all)
  end

  def update
  end

  def edit
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
        recipe_ingredients_attributes: [ :amount, ingredient_attributes: [ :name ] ],
        directions_attributes: [ :step, :direction ],
    )
  end
end