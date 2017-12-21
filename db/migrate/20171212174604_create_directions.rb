class CreateDirections < ActiveRecord::Migration[5.1]
  def change
    create_table :directions, primary_key: :direction_id do |t|
      t.integer :recipe_id, index: true, null: false
      t.integer :step_number
      t.text :description

      t.timestamps
    end
  end
end
