class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_area

  belongs_to :user
  belongs_to :category
  belongs_to_active_hash :state, :delivery_fee, :delivery_area, :delivery_method, :shipment_date
  has_one :item_photo

  with_options presence: true do
    validates :name
    validates :seller
    validates :price
    validates :purchase
    validates :explanation
    validates :category_id
    validates :stste_id
    validates :delivery_fee_id
    validates :delivery_are_id
    validates :delivery_method_id
    validates :shipment_date_id
  end
end
