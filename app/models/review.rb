class Review < ApplicationRecord

  has_many   :review_images, dependent: :destroy
  belongs_to :account
  belongs_to :restaurant

  enum meal_time: {昼: 0, 夜: 1}

end
