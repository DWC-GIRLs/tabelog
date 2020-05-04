class ChangeColumnToRates < ActiveRecord::Migration[5.2]
  def change
    change_column :rates, :all_score, :float, null: true
  end
end
