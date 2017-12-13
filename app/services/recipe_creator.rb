class RecipeCreator

  def initialize(args)
    @params = args[:recipe_params]
  end

  def execute
    recipe = Recipe.new

    recipe.transaction do
      recipe.title              = params[:title]
      recipe.summary            = params[:summary]
      recipe.yield              = params[:yield]
      recipe.prep_time          = params[:prep_time]
      recipe.cooking_time       = params[:cooking_time]
      recipe.recipe_category_id = params[:recipe_category_id]

      if params[:ingredients]
        recipe.recipe_ingredients << recipe_ingredients_from_params
      end

      if params[:directions]
        recipe.directions << directions_from_params
      end

      recipe.save!
    end

    recipe
  end

  private
  attr_reader :params

  def recipe_ingredients_from_params
    params[:ingredients].map do |ingredient|
      ingredient = Ingredient.find_or_initialize_by(name: ingredient[:name].downcase)
      RecipeIngredient.new(amount: ingredient[:amount], ingredient: ingredient)
    end
  end

  def directions_from_params
    params[:directions].map do |direction|
      Direction.new(step_number: direction[:step], direction: direction[:direction])
    end
  end
end

