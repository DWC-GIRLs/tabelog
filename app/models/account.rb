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
  def self.find_or_create_from_oauth(auth)
    Account.find_or_create_by(provider: auth.provider, uid: auth.uid) do |account|
      account.nick_name  = auth.info.nickname || auth.info.name
      account.avatar_url = auth.info.image
      account.email      = Account.dummy_email(auth)
      account.password   = Devise.friendly_token[0, 20]
    end
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']
    info = omniauth['info']
    self.nick_name = info['name']
    self.password = Devise.friendly_token[0, 20] # ランダムにパスワード作成
    # self.profile_image = info.['picture']
    # self.save!
  end


end
