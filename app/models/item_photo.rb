class ItemPhoto < ApplicationRecord
  belongs_to :item

  validates :thumbnail, presence: true
end
