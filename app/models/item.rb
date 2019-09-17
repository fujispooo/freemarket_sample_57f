class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_images, dependent: :destroy
  belongs_to :user
  belongs_to :item_state
  belongs_to :size, optional: true
  belongs_to :delivery_fee
  belongs_to :delivery_method
  belongs_to :delivery_day
  belongs_to :category,optional: true
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :item_images
  has_many :item_comments

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :brand, presence: true
  validates :category_id, presence: true
  validates :item_state_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :delivery_method_id, presence: true
  validates :delivery_day_id, presence: true
  validates :user_id, presence: true
  validates :prefecture_id, presence: true
end
