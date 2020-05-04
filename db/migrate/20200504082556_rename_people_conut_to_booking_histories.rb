class RenamePeopleConutToBookingHistories < ActiveRecord::Migration[5.2]
  def change
    rename_column :booking_histories, :pople_count, :people_count
    change_column :booking_histories, :reservation_number, :string
  end
end
