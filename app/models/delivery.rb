class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  with_options presence: { message: 'は空で入力しないでください。' } do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address 
  end

end
