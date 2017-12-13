class RecipeIndexDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def cook_name
    if object.cook
      object.cook.first_name
    end
  end

  def primary_photo_url
    if object.primary_photo.present?
      object.primary_photo.file.url
    end
  end

  def show_path
    recipe_path(object)
  end
end

