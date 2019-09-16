class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_one :address
  has_one :card
  has_one :SnsCredential
  has_one :card, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :card
  accepts_nested_attributes_for :SnsCredential
  has_many :items
  has_many :item_comments



  # 以下バリデーション
  validates :nickname       , presence: true ,length: {maximum: 20}
  validates :email          , presence: true ,uniqueness: true
  validates :password       , presence: true ,length: {minimum: 6, maximum: 128}
  validates :first_name     , presence: true
  validates :last_name      , presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana , presence: true
  validates :birth_year     , presence: true
  validates :birth_month    , presence: true
  validates :birth_day      , presence: true
  validates :phone_number   , presence: true



  #  googleとfacebookのsns認証
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id)
      else
        user = User.new(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          phone_number: "00000000000"
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id)
      end
    end
    return user
  end
end
