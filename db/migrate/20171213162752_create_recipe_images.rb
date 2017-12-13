class CreateRecipeImages < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_images, primary_key: :recipe_image_id do |t|
      t.references :recipes, index: true
      t.references :images, index: true

      t.timestamps
    end
  end
end
