class RecipeEditDecorator < Draper::Decorator
  delegate_all

  def ingredients
    object.recipe_ingredients.includes(:ingredient).map do |recipe_ingredient|
      { name: recipe_ingredient&.ingredient&.name, amount: recipe_ingredient&.amount }
    end
  end

  def directions
    object.directions
  end
end

