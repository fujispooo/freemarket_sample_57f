class SnsCredential < ApplicationRecord
  belongs_to :user

  validates :uid     , presence: true
  validates :provider, presence: true
  validates :user_id , presence: true
end
