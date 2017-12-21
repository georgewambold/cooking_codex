class Image < ApplicationRecord
  has_many :recipe_images
  has_many :recipes, through: :recipe_images

  has_attached_file :file, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
