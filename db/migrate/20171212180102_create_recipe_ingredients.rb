class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :ingredient_id, null: false
      t.integer :recipe_id, null: false
      t.string :amount

      t.timestamps
    end
  end
end
