class Item < ApplicationRecord

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
