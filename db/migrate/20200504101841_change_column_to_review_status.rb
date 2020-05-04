class ChangeColumnToReviewStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :reviews, :status, from: 0, to: 1
  end
end
