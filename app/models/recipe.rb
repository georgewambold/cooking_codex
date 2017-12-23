class Recipe < ApplicationRecord
  has_attached_file :image,
    styles: { thumb: '348x348>',
              medium: '350x350>' }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :recipe_category, optional: true

  belongs_to :cook, optional: true

  has_many :directions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :directions
  accepts_nested_attributes_for :recipe_ingredients

  alias_method :category, :recipe_category

  validates :title, presence: true
end
