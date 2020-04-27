class Accounts::SearchController < ApplicationController

  def area
    @restaurants = Restaurant.search_area(params[:search])
  end

  def keyword
    s_area_codes = fetch_s_area_codes(params[:area_q])
    results_by_area_codes = Restaurant.search_by_area_codes(s_area_codes) unless s_area_codes

    results_by_restaurant_address = Restaurant.search_by_restaurant_address(params[:area_q])

    results = (results_by_area_codes += results_by_restaurant_address).flatten.uniq
    @restaurants= results
    render template: "accounts/restaurants/index"
  end

  def genre
    @restaurants = Restaurant.search_genre(params[:genre_name])
  end

  def booking
  end

  def detail
  end

  private
  def fetch_s_area_codes(area_q)
    encoded_uri = URI.encode("https://webservice.recruit.co.jp/hotpepper/small_area/v1/?key=#{ENV['RESTAURANT_API_KEY']}&keyword=#{area_q}&format=json")
    patsed_uri = URI.parse(encoded_uri)
    response = Net::HTTP.get(patsed_uri)
    results = JSON.parse(response)['results']

    return false if results['results_available'] == 0

    area_codes = results["#{area_size}_area"].map{|result| result['code']}
    return area_codes
  end
end
