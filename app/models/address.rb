class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  # 独自バリデーションを定義-------------------------------------------------------------------
    # 全角カナ・ひらがな・漢字
    class ZenkakuKanaHiraganaKanjiValidator < ActiveModel::EachValidator
      ZENKAKU_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
      def validate_each(record, attribute,value)
        if value.present?
          if value.match(ZENKAKU_REGEX).blank?
            record.errors.add(attribute, '全角かな・ひらがな・漢字で入力してください')
          end
        end
      end
    end

    # 電話番号
    class PhoneNumberValidator < ActiveModel::EachValidator
      PHONE_REGEX = /\A0[0-9]{9,11}\z/
      def validate_each(record, attribute,value)
        if value.present?
          if value.match(PHONE_REGEX).blank?
            record.errors.add(attribute, '不正な電話番号です')
          end
        end
      end
    end

    # 郵便番号
    class PostNumberValidator < ActiveModel::EachValidator
      POST_REGEX = /\A\d{3}\-\d{4}\z/
      def validate_each(record, attribute,value)
        if value.present?
          if value.match(POST_REGEX).blank?
            record.errors.add(attribute, '不正な郵便番号です')
          end
        end
      end
    end
  # ---------------------------------------------------------------------------------------  
  

  # 以下バリデーション------------------------------------------------------------------------
  validates :post_number   , presence: true ,post_number: true
  validates :prefecture_id , presence: true ,inclusion: 1..47
  validates :city          , presence: true ,zenkaku_kana_hiragana_kanji: true
  validates :address       , presence: true
  validates :user_id       , presence: true 
  validates :building_name ,length:{maximum: 25}
  validates :building_tel  ,phone_number: true
  # ---------------------------------------------------------------------------------------
end