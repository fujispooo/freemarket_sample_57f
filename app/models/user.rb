class User < ApplicationRecord
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  # リレーション-----------------------------------------------------------------------------
  has_many :items
  has_one  :address
  has_one  :SnsCredential, dependent: :destroy
  has_one  :card         , dependent: :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :SnsCredential
  # ---------------------------------------------------------------------------------------




  # 独自バリデーションを定義-------------------------------------------------------------------
    # 全角カタカナ
    class KatakanaValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value) # バリデーションメソッド
          value !~  /\A[\p{katakana}ー－]+\z/
      end
    end

    # 全角カナ・ひらがな・漢字
    class ZenkakuKanaHiraganaKanjiValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value) # バリデーションメソッド
          value !~ /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
      end
    end

    # メールアドレス
    class OriginalEmailValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value) # バリデーションメソッド
          value !~ /\A[a-zA-Z]+[[^\-{2,}][\w+\-]].?@[a-z\d]+(\.[a-z]+)*\.[a-z]+\z/i
      end
    end

    # 電話番号
    class PhoneNumberValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value) # バリデーションメソッド
          value !~  /\A0[0-9-]{9,11}\z/
      end
    end
  # ---------------------------------------------------------------------------------------




  # 以下バリデーション------------------------------------------------------------------------
  validates :nickname       , presence: true ,length: {minimum: 2, maximum: 10 }
  validates :email          , presence: true ,uniqueness: true,original_email: true
  validates :password       , presence: true ,length: {minimum: 6, maximum: 128}
  validates :first_name     , presence: true ,zenkaku_kana_hiragana_kanji: true
  validates :last_name      , presence: true ,zenkaku_kana_hiragana_kanji: true
  validates :first_name_kana, presence: true ,katakana: true
  validates :last_name_kana , presence: true ,katakana: true
  validates :birth_year     , presence: true
  validates :birth_month    , presence: true
  validates :birth_day      , presence: true
  validates :phone_number   , presence: true ,phone_number
  # ---------------------------------------------------------------------------------------




  #  googleとfacebookのsns認証--------------------------------------------------------------
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
  # ---------------------------------------------------------------------------------------
end
