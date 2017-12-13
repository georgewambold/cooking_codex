class Recipe < ApplicationRecord
  belongs_to :recipe_category

  belongs_to :cook

  has_many :directions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_images
  has_many :images, through: :recipe_images

  alias_method :category, :recipe_category

  def primary_photo
    images.find(primary_photo_id)
  end
end
