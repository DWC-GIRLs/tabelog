class RemoveDetailsFromRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :wifi_memo, :string
    remove_column :restaurants, :card_memo, :string
    remove_column :restaurants, :non_smoking_memo, :string
    remove_column :restaurants, :karaoke_memo, :string
    remove_column :restaurants, :tv_memo, :string
    remove_column :restaurants, :english_memo, :string
    remove_column :restaurants, :pet_memo, :string
    remove_column :restaurants, :lunch_memo, :string
    remove_column :restaurants, :midnight_memo, :string

    change_column :restaurants, :shop_id, :string
  end
end
