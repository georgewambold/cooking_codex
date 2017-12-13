class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient
  delegate :name, to: :ingredient
end
