class CreateBookingHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_histories do |t|
      t.integer :account_id
      t.integer :restaurant_id
      t.integer :reservation_number, null: false
      t.date :date, null: false
      t.integer :pople_count, null: false
      t.integer :total_price, null: false
      t.integer :reservation_status, null: false
      t.string :notes

      t.timestamps
    end
  end
end
