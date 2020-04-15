class AddDetailsFromRestaurant < ActiveRecord::Migration[5.2]
  def up
    add_column :restaurants, :user_id, :integer
    add_index :restaurants, [:id, :user_id]
  end
end
