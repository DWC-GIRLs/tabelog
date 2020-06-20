class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants, dependent: :destroy

  validates :phone_number,
            presence: :true,
            numericality: { only_integer: true }

  validates :first_name, :last_name, :first_kana, :last_kana,
            presence: :true

  def fullname
    self.first_name + self.last_name
  end
end
