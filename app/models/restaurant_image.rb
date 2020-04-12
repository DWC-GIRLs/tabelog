class RestaurantImage < ApplicationRecord
  belongs_to :restaurant

  attachment :image
end
