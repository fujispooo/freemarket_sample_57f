class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_images, dependent: :destroy
  belongs_to :user
  belongs_to :brand, optional: true
  # カラムいるかも
  # belongs_to :profit
  belongs_to :item_state
  belongs_to :size, optional: true
  belongs_to :delivery_fee
  belongs_to :delivery_method
  belongs_to :delivery_day
  belongs_to :category,optional: true
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :item_images
end
