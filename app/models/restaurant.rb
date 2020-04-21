class Restaurant < ApplicationRecord
  has_many :booking_histries, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy
  has_many :restaurant_images,    dependent: :destroy

  attachment :logo_image
  accepts_attachments_for :restaurant_images, attachment: :image

  def self.search_by_keyword(q)
    require 'net/http'
    require 'json'
    Dotenv.load

    splited_q = q.split(/[[:blank:]]+/)
    restaurants = []
    binding.pry
    splited_q.each do |q|
      next if q == ""
      # queryに地名が含まれていたらその情報を優先して出す
      l_area_response = Net::HTTP.get("http://webservice.recruit.co.jp/hotpepper/large_area/v1/?key=#{ENV['RESTAURANT_API_KEY']}&keyword=#{q}")
      parsed_l_area_response = JSON.parse(l_area_response)
      if l_area_response['results']['results_available'] === 0
        search_db(q)
      else
        Restaurant.find_by(l_area_code: ['results']['large_area']['code'])
      end
    end
    return restaurants.uniq!
  end

  def search_db(query)
    query.each do |q|
      restaurants += Restaurant.where('name LIKE ?', "%#{q}%")
      restaurants += Restaurant.where('name_kana LIKE ?', "%#{q}%")
      restaurants += Restaurant.where('search_keyword LIKE ?', "%#{q}%")
      restaurants += Restaurant.where('catch LIKE ?', "%#{q}%")
    end
  end
end
