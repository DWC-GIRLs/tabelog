# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_16_070501) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "status", default: 1, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "first_kana"
    t.string "last_kana"
    t.string "nick_name", null: false
    t.string "phone_number"
    t.integer "sex", default: 0, null: false
    t.integer "birthday"
    t.integer "era"
    t.string "cover_image_id"
    t.string "profile_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["provider", "uid"], name: "index_accounts_on_provider_and_uid", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "booking_histories", force: :cascade do |t|
    t.integer "account_id"
    t.integer "restaurant_id"
    t.integer "reservation_number", null: false
    t.date "date", null: false
    t.integer "pople_count", null: false
    t.integer "total_price", null: false
    t.integer "reservation_status", null: false
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "status", default: 0, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "first_kana"
    t.string "last_kana"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "rates", force: :cascade do |t|
    t.integer "account_id"
    t.integer "restaurant_id"
    t.integer "review_id"
    t.float "all_score", null: false
    t.float "cuisine"
    t.float "drink"
    t.float "service"
    t.float "cost_performance"
    t.float "atmosphere"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_images", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.string "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "shop_id"
    t.string "name"
    t.string "logo_image_id"
    t.string "name_kana"
    t.string "address"
    t.string "station_name"
    t.string "l_area_code"
    t.string "m_area_code"
    t.string "s_area_code"
    t.float "lat"
    t.float "lng"
    t.string "genre_code"
    t.string "genre_name"
    t.string "search_keyword"
    t.string "catch"
    t.integer "capacity"
    t.string "access"
    t.string "urls"
    t.string "open"
    t.string "close"
    t.integer "party_capacity"
    t.integer "wifi", default: 0
    t.integer "free_drink", default: 0
    t.string "free_drink_memo"
    t.integer "free_food", default: 0
    t.string "free_food_memo"
    t.integer "private_room", default: 0
    t.string "private_room_memo"
    t.integer "horigotatsu", default: 0
    t.string "horigotatsu_memo"
    t.integer "tatami", default: 0
    t.string "tatami_memo"
    t.integer "card", default: 0
    t.integer "non_smoking", default: 0
    t.integer "charter", default: 0
    t.string "charter_memo"
    t.integer "parking", default: 0
    t.string "parking_memo"
    t.integer "barrier_free", default: 0
    t.string "barrier_free_memo"
    t.integer "karaoke", default: 0
    t.integer "tv", default: 0
    t.integer "english", default: 0
    t.integer "pet", default: 0
    t.integer "child", default: 0
    t.string "child_memo"
    t.integer "lunch", default: 0
    t.integer "midnight", default: 0
    t.string "other_memo"
    t.string "shop_detail_memo"
    t.string "coupon_urls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["id", "owner_id"], name: "index_restaurants_on_id_and_owner_id"
    t.index ["id"], name: "index_restaurants_on_id_and_user_id"
  end

  create_table "review_images", force: :cascade do |t|
    t.integer "review_id"
    t.string "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "account_id"
    t.integer "rate_id"
    t.integer "restaurant_id"
    t.integer "status", default: 0, null: false
    t.string "comment", null: false
    t.integer "unit_price"
    t.integer "meal_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
