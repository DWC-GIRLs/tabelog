class CreateBookingHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_histories do |t|
      t.integer :account_id
      t.integer :rate_id
      t.integer :reservation_number
      t.date :date
      t.integer :pople_count
      t.integer :total_price
      t.integer :reservation_status
      t.string :notes

      t.timestamps
    end
  end
end
