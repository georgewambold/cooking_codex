class RecipeImage < ApplicationRecord
  belongs_to :recipe
  belongs_to :image
end
