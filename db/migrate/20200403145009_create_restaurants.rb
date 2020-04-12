class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :shop_id
      t.string :name
      t.string :logo_image_id
      t.string :name_kana
      t.string :address
      t.string :station_name
      t.string :l_area_code
      t.string :m_area_code
      t.string :s_area_code
      t.float :lat
      t.float :lng
      t.string :genre_code
      t.string :genre_name
      t.string :search_keyword
      t.string :catch
      t.integer :capacity
      t.string :access
      t.string :urls
      t.string :open
      t.string :close
      t.integer :party_capacity
      t.integer :wifi, default: 0
      t.string :wifi_memo
      t.integer :free_drink, default: 0
      t.string :free_drink_memo
      t.integer :free_food, default: 0
      t.string :free_food_memo
      t.integer :private_room, default: 0
      t.string :private_room_memo
      t.integer :horigotatsu, default: 0
      t.string :horigotatsu_memo
      t.integer :tatami, default: 0
      t.string :tatami_memo
      t.integer :card, default: 0
      t.string :card_memo
      t.integer :non_smoking, default: 0
      t.string :non_smoking_memo
      t.integer :charter, default: 0
      t.string :charter_memo
      t.integer :ktai, default: 0
      t.string :ktai_memo
      t.integer :parking, default: 0
      t.string :parking_memo
      t.integer :barrier_free, default: 0
      t.string :barrier_free_memo
      t.integer :karaoke, default: 0
      t.string :karaoke_memo
      t.integer :tv, default: 0
      t.string :tv_memo
      t.integer :english, default: 0
      t.string :english_memo
      t.integer :pet, default: 0
      t.string :pet_memo
      t.integer :child, default: 0
      t.string :child_memo
      t.integer :lunch, default: 0
      t.string :lunch_memo
      t.integer :midnight, default: 0
      t.string :midnight_memo
      t.string :other_memo
      t.string :shop_detail_memo
      t.string :coupon_urls

      t.timestamps
    end
  end
end
