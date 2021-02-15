class Card < ApplicationRecord
  belongs_to :user, foreign_key: true

  validates :customer_id,  presence: true
  validates :card_id,      presence: true

end
