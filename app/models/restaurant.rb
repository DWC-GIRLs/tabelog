class Restaurant < ApplicationRecord
  has_many :booking_histries, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy
  has_many :restaurant_images,    dependent: :destroy

  attachment :logo_image
  accepts_attachments_for :restaurant_images, attachment: :image

  def self.search_area(area)
    return Restaurant.all unless area
    Restaurant.where(['address LIKE ?', "%#{area}%"])
    #文字列のどの部分にでも検索したい文字列が含まれていればOK
  end
end
