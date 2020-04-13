require 'net/http'
require 'json'
require 'pry'
require 'dotenv'
Dotenv.load

uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['RESTAURANT_API_KEY']}&count=5&format=json&keyword=%E9%96%A2%E6%9D%B1")
response = Net::HTTP.get(uri)
parsed_response = JSON.parse(response)
shops = parsed_response["results"]["shop"]
shops.each do |shop|
  # Restaurant.create(
    # shop_id: shop['id']
    # name: shop['name']
# puts    logo_image_id: shop['logo_image']
# puts    name_kana: shop['name_kana']
# puts    address: shop['address']
# puts    station_name: shop['station_name']
# puts    l_area_code: shop['large_area']['code']
# puts    m_area_code: shop['middle_area']['code']
# puts    s_area_code: shop['small_area']['code']
# puts    lat: shop['lat']
# puts    lng: shop['lng']
# puts    genre_code: shop['genre']['code']
# puts    genre_name: shop['genre']['name']
puts    search_keyword: shop['']
# puts    catch: shop['catch']
# puts    capacity: shop['capacity']
# puts    access: shop['access']
# puts     urls: shop['urls']['pc']
# puts     open: shop['open']
# puts     close: shop['close']
puts     party_capacity: shop['party_capacity']
if shop['wifi'] == "あり"
  wifi: 0
else
  wifi: 1
end
  # )
end