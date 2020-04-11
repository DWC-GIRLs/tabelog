class Restaurant < ApplicationRecord
  has_many :booking_histries, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy
  has_many :restaurant_images,    dependent: :destroy

  attachment :logo_image
  accepts_attachments_for :restaurant_images, attachment: :image
end
