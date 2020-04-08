class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :booking_histries, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy

  attachment :profile_image

  # omniauthのコールバック時に発火
  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |account|
     account.first_name = auth.info.first_name
     account.last_name = auth.info.last_name
     account.nick_name = auth.info.name
     account.email = auth.info.email
     account.password = Devise.friendly_token[0,20] # ランダムなパスワードを作成
     account.profile_image = auth.info.image.gsub("picture","picture?type=large") if account.provider == "facebook"
     account.profile_image = auth.info.image.gsub("picture","picture?type=large") if account.provider == "line"
     # account.profile_image = auth.info.image.gsub("_normal","") if account.provider == "twitter"
   end
  end

end
