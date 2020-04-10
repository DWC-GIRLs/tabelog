require 'net/http'
require 'json'
require 'pry'
require 'dotenv'
Dotenv.load

uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['RESTAURANT_API_KEY']}&count=2&format=json&keyword=%E6%96%B0%E5%AE%BF%0A")
response = Net::HTTP.get(uri)
parsed_response = JSON.parse(response)
shops = parsed_response["results"]["shop"]
# shop_ids = shops.map {|shop| shop["id"]}
# shop_names = shops.map {|shop| shop["name"]}
puts parsed_response