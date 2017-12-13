class Image < ApplicationRecord
  has_many :recipe_images
  has_many :recipies, through: :recipe_images

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
end
