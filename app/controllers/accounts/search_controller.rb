class Accounts::SearchController < ApplicationController

  def keyword
    unless params[:area_q] == ""
      area_q_array = params[:area_q].split(/[[:blank:]]+/)

      s_area_codes = fetch_s_area_codes(area_q_array)
      results_by_area_codes = Restaurant.search_by_area_codes(s_area_codes) unless s_area_codes == []

      results_by_area_q = Restaurant.search_by_area(area_q_array)

      if !results_by_area_codes
        last_results_by_area_q = results_by_area_q
      else
        last_results_by_area_q = (results_by_area_codes += results_by_area_q).flatten.uniq
      end
    end

    unless params[:keyword_q] == ""
      keyword_q_array = params[:keyword_q].split(/[[:blank:]]/)
      results_by_keyword_q_array = Restaurant.search_by_keyword(keyword_q_array)
    end

    if params[:area_q] != "" && params[:keyword_q] != ""
      last_results = results_by_area_q.map{|result|
        next unless results_by_keyword_q_array.any? result
        result
      }.compact
    elsif params[:area_q] != ""
      last_results = results_by_area_q
    elsif params[:keyword_q] != ""
      last_results = results_by_keyword_q_array
    end
    @restaurants= last_results
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
  def fetch_s_area_codes(area_q_array)
    require 'net/http'
    require 'json'

    area_codes = []
    area_q_array.each do |area_q|
      encoded_uri = URI.encode("https://webservice.recruit.co.jp/hotpepper/small_area/v1/?key=#{ENV['RESTAURANT_API_KEY']}&keyword=#{area_q}&format=json")
      patsed_uri = URI.parse(encoded_uri)
      response = Net::HTTP.get(patsed_uri)
      results = JSON.parse(response)['results']

      next false if results['results_available'] == 0

      results["small_area"].map{|result| area_codes << result['code']}
    end

    uniqed_area_codes = area_codes.uniq
    return uniqed_area_codes
  end
end
