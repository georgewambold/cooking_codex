class RecipeIndexDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def cook_name
    object.cook.first_name
  end

  def primary_photo_url
    object.primary_photo.image.url
  end

  def show_path
    recipe_path(object)
  end
end

