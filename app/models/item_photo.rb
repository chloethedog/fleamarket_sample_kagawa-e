class ItemPhoto < ApplicationRecord
  belongs_to :ItemPhoto


  validates :thumbnail, presence: true
end
