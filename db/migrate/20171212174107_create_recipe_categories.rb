class CreateRecipeCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_categories, primary_key: :recipe_category_id do |t|
      t.string :name
    end
  end
end
