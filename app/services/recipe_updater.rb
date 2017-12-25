class RecipeUpdater

  def initialize(args)
    @recipe = args[:recipe]
    @params = args[:recipe_params]
  end

  def execute
    @recipe.transaction do
      @recipe.image              = params[:image]
      @recipe.title              = params[:title]
      @recipe.summary            = params[:summary]
      @recipe.yield              = params[:yield]
      @recipe.prep_time          = params[:prep_time]
      @recipe.cooking_time       = params[:cooking_time]
      @recipe.recipe_category_id = params[:recipe_category_id]

      if params[:recipe_ingredients_attributes]
        @recipe.recipe_ingredients.destroy_all
        @recipe.recipe_ingredients << recipe_ingredients_from_params
      end

      if params[:directions_attributes]
        @recipe.directions.destroy_all
        @recipe.directions << directions_from_params
      end

      @recipe.save!
    end

    @recipe
  end

  private
  attr_reader :params, :recipe

  def recipe_ingredients_from_params
    params[:recipe_ingredients_attributes].map do |recipe_ingredient|
      ingredient = Ingredient.find_or_initialize_by(name: recipe_ingredient[:ingredient_attributes][:name])
      RecipeIngredient.new(amount: recipe_ingredient[:amount], ingredient: ingredient)
    end
  end

  def directions_from_params
    params[:directions_attributes].map do |direction|
      Direction.new(step_number: direction[:step_number], description: direction[:description])
    end
  end
end

