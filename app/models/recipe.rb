class Recipe < ApplicationRecord
  belongs_to :recipe_category, optional: true
  belongs_to :cook, optional: true
  belongs_to :primary_photo, foreign_key: :primary_image_id, class_name: "Image", optional: true

  has_many :directions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_images
  has_many :images, through: :recipe_images

  accepts_nested_attributes_for :directions
  accepts_nested_attributes_for :recipe_ingredients

  alias_method :category, :recipe_category

  validates :title, presence: true
end
