class Owners::RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
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
      # redirect_back(fallback_location: new_owners_restaurant_path(current_owner))
      @new_restaurant = new_restaurant
      render :new
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
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
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
                                        :other_memo, :shop_detail_memo, :coupon_urls,
                                        :owner_id, restaurant_images_images: []
                                      )
  end
end
