class CreateRestaurantImages < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_images do |t|
      t.integer :restaurant_id, null: false
      t.string :image_id, null: false

      t.timestamps
    end
  end
end
