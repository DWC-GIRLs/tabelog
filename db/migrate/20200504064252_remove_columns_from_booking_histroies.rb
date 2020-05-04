class RemoveColumnsFromBookingHistroies < ActiveRecord::Migration[5.2]
  def change
    add_column    :booking_histories, :time, :string
    remove_column :booking_histories, :total_price, :integer
    change_column :booking_histories, :reservation_status, :integer, :default => 0
  end
end
