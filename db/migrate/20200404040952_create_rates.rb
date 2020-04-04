class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :account_id
      t.integer :restaurant_id
      t.integer :review_id
      t.float :all_score, null: false
      t.float :cuisine
      t.float :drink
      t.float :service
      t.float :cost_performance
      t.float :atmosphere

      t.timestamps
    end
  end
end
