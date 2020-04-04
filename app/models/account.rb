class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :booking_histries, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy
  
end
