class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients, primary_key: :ingredient_id do |t|
      t.string :name

      t.timestamps
    end
  end
end
