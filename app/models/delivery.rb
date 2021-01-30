class Delivery < ApplicationRecord
  belongs_to_active_hash :prefectures
  belongs_to :user, optional: true
  
  validates :postal_code, :prefectures_id, :municipality, :address ,presence: true
end
