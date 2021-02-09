class ItemPhoto < ApplicationRecord
  belongs_to :item, optional: :true

  validates :thumbnail, presence: true
end
