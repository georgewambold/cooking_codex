class RecipeIndexDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def cook_name
    if object.cook
      object.cook.first_name&.capitalize
    end
  end

  def primary_photo_url
    if object.image
      object.image.url(:original)
    end
  end

  def show_path
    recipe_path(object)
  end
end

