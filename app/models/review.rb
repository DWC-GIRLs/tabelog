class Review < ApplicationRecord

  has_many   :review_images, dependent: :destroy
  belongs_to :account
  belongs_to :restaurant

  enum meal_time: [:夜, :昼]
  enum unit_price:[
    :ー,
    :〜￥999,
    :￥1000〜￥1999,
    :￥2000〜￥2999,
    :￥3000〜￥3999,
    :￥4000〜￥4999,
    :￥5000〜￥5999,
    :￥7000〜￥7999,
    :￥8000〜￥9999,
    :￥10000〜￥14999,
    :￥15000〜￥19999,
    :￥20000〜￥29999,
    :￥30000〜￥39999,
    :￥40000〜￥49999,
    :￥50000〜￥59999,
    :￥60000〜￥79999,
    :￥80000〜￥99999,
    :￥100000〜
  ]

end
