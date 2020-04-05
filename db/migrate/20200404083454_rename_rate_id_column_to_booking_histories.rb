class RenameRateIdColumnToBookingHistories < ActiveRecord::Migration[5.2]
  def change
    rename_column :booking_histories, :rate_id, :restaurant_id
  end
end
