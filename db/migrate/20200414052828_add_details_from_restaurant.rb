class AddDetailsFromRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :user_id, :integer
    remove_column :restaurants, :ktai_memo, :string
    remove_column :restaurants, :ktai, :integer
    remove_column :accounts, :profile_image, :string
  end
end
