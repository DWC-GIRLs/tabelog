class Review < ApplicationRecord

  has_many   :review_images, dependent: :destroy
  belongs_to :account
  belongs_to :restaurant
  
end
