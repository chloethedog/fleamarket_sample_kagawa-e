class ItemPhoto < ApplicationRecord
  belongs_to :item, optional: :true

  mount_uploader :thumbnail, ImageUploader
end
