class RecipeShowDecorator < Draper::Decorator
  delegate_all

  def current_date
    Date.current.strftime('%^b %e, %Y')
  end

  def recipe_author
    if object.cook
      object.cook.first_name&.capitalize
    end
  end

  def primary_photo_url
    if object.image
      object.image.url(:original)
    end
  end

  def recipe_ingredients
    object.recipe_ingredients
  end

  def directions
    object.directions.order(:step_number)
  end
end
