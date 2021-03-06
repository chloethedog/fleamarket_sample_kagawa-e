class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :seller, class_name:'User', optional: true
  belongs_to :buyer, class_name:'User', optional: true
  belongs_to :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :shipment_date
  has_one :item_photo, dependent: :destroy
  has_many :comments
  has_many :favorites
  accepts_nested_attributes_for :item_photo, allow_destroy: true

  with_options presence: true do
    validates :name
    validates :price, numericality: {greater_than: 299, less_than: 10000000}
    validates :explanation
    validates :state_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_method_id
    validates :shipment_date_id
    validates :purchase
    validates :item_photo
  end

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
  
end
