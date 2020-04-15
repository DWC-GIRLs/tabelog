class RemoveColumnFromRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :ktai_memo, :string
    remove_column :restaurants, :ktai, :integer
  end
end
