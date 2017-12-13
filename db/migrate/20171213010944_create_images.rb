class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images, primary_key: :image_id do |t|
      t.attachment :file

      t.timestamps
    end
  end
end
