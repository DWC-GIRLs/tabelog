class Restaurant < ApplicationRecord

  has_many :booking_histries, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy
  has_many :review_images     dependent: :destroy
  
end
