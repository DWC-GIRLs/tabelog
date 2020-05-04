class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :comment, :string, null: true
  end
end
