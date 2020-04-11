class Owners::RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @new_restaurant = Restaurant.new
  end

  def create
    new_restaurant = Restaurant.new(restaurant_params)
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
    params.require(:restaurant).permit(:shop_id, :name, :logo_image, :name_kana, :address,
                                        :station_name, :l_area_code, :m_area_code, :s_area_code,
                                        :lat, :lng, :genre_code, :genre_name, :search_keyword,
                                        :catch, :capacity, :access, :urls, :photo, :open, :close,
                                        :party_capacity, :wifi, :free_drink, :free_food, :private_room,
                                        :horigotatsu, :tatami, :card, :non_smoking, :charter, :ktai,
                                        :parking, :barrier_free, :other_memo, :karaoke, :tv, :english,
                                        :pet, :child, :lunch, :midnight, :shop_detail_memo, :coupon_urls,
                                        restaurant_images_images: []
                                      )
  end
end
