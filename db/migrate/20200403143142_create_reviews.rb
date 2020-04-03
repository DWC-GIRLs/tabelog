class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :account_id
      t.integer :rate_id
      t.integer :status
      t.string :comment
      t.integer :unit_price
      t.integer :meal_time

      t.timestamps
    end
  end
end
