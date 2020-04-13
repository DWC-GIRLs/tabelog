require 'net/http'
require 'json'
require 'pry'
require 'dotenv'
Dotenv.load

uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['RESTAURANT_API_KEY']}&count=2&format=json&keyword=%E9%96%A2%E6%9D%B1")
response = Net::HTTP.get(uri)
parsed_response = JSON.parse(response)
shops = parsed_response["results"]["shop"]
shops.each do |shop|
  Restaurant.create!(
    shop_id: shop['id'],
    name: shop['name']
  )
end