class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :booking_histries, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy

  attachment :profile_image
  attachment :cover_image

  # omniauthのコールバック時に発火
  def self.find_omniauth(auth)
    account = Account.find_by(provider: auth.provider, uid: auth.uid) #送られてきたデータのproviderとuidを元に探す
    unless account #レコードが見つからない時に発火
      Account.transaction do
        account = Account.create!(
          provider:         auth.provider,
          uid:              auth.uid,
          nick_name:        auth.info.name,
          email:            auth.info.email,
          # profile_image_id: auth.info.image,
          password:         Devise.friendly_token[0,20] #ランダムにパスワード作成
        )
      end
    end
    account
  end

end
