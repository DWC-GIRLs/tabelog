class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :shop_id
      t.string :name
      t.string :logo_image
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
      t.string :photo
      t.string :open
      t.string :close
      t.integer :party_capacity
      t.integer :wifi, default: 0
      t.integer :free_drink, default: 0
      t.integer :free_food, default: 0
      t.integer :private_room, default: 0
      t.integer :horigotatsu, default: 0
      t.integer :tatami, default: 0
      t.integer :card, default: 0
      t.integer :non_smoking, default: 0
      t.integer :charter, default: 0
      t.integer :ktai, default: 0
      t.integer :parking, default: 0
      t.integer :barrier_free, default: 0
      t.integer :other_memo, default: 0
      t.integer :karaoke, default: 0
      t.integer :tv, default: 0
      t.integer :english, default: 0
      t.integer :pet, default: 0
      t.integer :child, default: 0
      t.integer :lunch, default: 0
      t.integer :midnight, default: 0
      t.string :shop_detail_memo
      t.string :coupon_urls

      t.timestamps
    end
  end
end
