class AddColumnFromRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :owner_id, :integer
    add_index :restaurants, [:id, :owner_id]
  end
end
