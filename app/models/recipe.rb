class Recipe < ApplicationRecord
  lookup_for :recipe_category

  has_many :directions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  alias_method :category, :recipe_category
end
