class Restaurant < ApplicationRecord
  has_many :booking_histries, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy
  has_many :restaurant_images,    dependent: :destroy

  attachment :logo_image
  accepts_attachments_for :restaurant_images, attachment: :image

  def self.search_by_area_codes(area_codes)
    area_resutlts = area_codes.map{|code| Restaurant.where(s_area_code: code)}
    if area_resutlts.size == 0
      return false
    else
      return area_results
    end
  end

  def self.search_by_restaurant_address(area_q)
    phrase_results = Restaurant.where(['address LIKE ?', "%#{area_q}%"])
    splited_area_q = area_q.split(/\s*/)
    broad_results = splited_area_q.map{|q| Restaurant.where(['address LIKE ?', "%#{q}%"])}
    results = (phrase_results += broad_results).flatten.uniq
    return results
  end

  def self.search_genre(genre)
    return Restaurant.all unless genre
    Restaurant.where(['genre_name LIKE ?', "%#{genre}%"])
  end
end
