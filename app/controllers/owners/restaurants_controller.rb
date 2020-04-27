class Owners::RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    opening_hours = @restaurant.open
    # 開店11:00の11
    opening_hr = opening_hours.scan(/\d{1,2}/)[0].to_i
    # 開店11:00の0
    opening_min = opening_hours.scan(/\d{1,2}/)[1].to_i
    # 閉店21:00の21
    closing_hr = opening_hours.scan(/\d{1,2}/)[2].to_i
    # 閉店21:00の0
    closing_min = opening_hours.scan(/\d{1,2}/)[3].to_i
    # 開店時間〜閉店時間の時間部分を配列に入れる ex)[11,12,13...]
    op_hours = [*opening_hr..closing_hr]
    @results = []
    op_hours.each do |hour|
      # 閉店時間の30分前まで繰り返す
      if hour == op_hours.last
        break
      end
      opening_min = opening_hours.scan(/\d{1,2}/)[1].to_i
      # ex) 11:00, 12:00 時間きっかりの場合
      if opening_min == 0
        # 時間を文字に置き換え、分を最低2桁以上にして文字に変換　ex)11:00
        time = hour.to_s + ':' + format('%02d', 0)
        # 配列にpush、入れる
        @results << time
        # 30分間隔
        time = hour.to_s + ':' + format('%02d', 30)
        @results << time
      else
        # ex)11:30開店の場合
        time = hour.to_s + ':' + format('%02d', opening_min)
        @results << time
        # 12:00を作る
        hour += 1
        # 閉店時間の30分前まで繰り返す
        if hour == op_hours.last
          break
        end
        time = hour.to_s + ':' + format('%02d', 0)
        @results << time
      end
    end
  end

  def new
    @new_restaurant = Restaurant.new
  end

  def create
    new_restaurant = Restaurant.new(restaurant_params)
    new_restaurant.shop_id = SecureRandom.hex(8)
    if new_restaurant.save
      redirect_to owners_restaurant_path(new_restaurant)
    else
      flash[:error] = "保存されてませ～んm9(^Д^)ﾌﾟｷﾞｬｰ"
      redirect_back(fallback_location: owners_mypage_path(current_owner))
    end
  end

  def welcome
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def goodbye
  end

  def destroy
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:shop_id, :name, :logo_image, :name_kana, :address, :station_name,
                                        :l_area_code, :m_area_code, :s_area_code, :lat, :lng, :genre_code, :genre_name,
                                        :search_keyword, :catch, :capacity, :access, :urls, :photo, :open, :close, :party_capacity,
                                        :wifi,
                                        :free_drink, :free_drink_memo,
                                        :free_food, :free_food_memo,
                                        :private_room, :private_room_memo,
                                        :horigotatsu, :horigotatsu_memo,
                                        :tatami, :tatami_memo,
                                        :card,
                                        :non_smoking,
                                        :charter, :charter_memo,
                                        :parking, :parking_memo,
                                        :barrier_free, :barrier_free_memo,
                                        :karaoke, :karaoke_memo,
                                        :tv,
                                        :english,
                                        :pet,
                                        :child, :child_memo,
                                        :lunch,
                                        :midnight,
                                        :other_memo, :shop_detail_memo, :coupon_urls, restaurant_images_images: []
                                      )
  end
end
