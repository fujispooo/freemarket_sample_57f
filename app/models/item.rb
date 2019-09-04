class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_comments
  has_many :item_images
  has_many :transactions, dependent: :destroy
  belongs_to :user
  belongs_to :brand
  # カラムいるかも
  belongs_to :profit
  belongs_to :item_state
  belongs_to :size
  belongs_to :delivery_fee
  belongs_to :delivery_method
  belongs_to :delivery_day
  belongs_to :category
  belongs_to_active_hash :prefecture
end
