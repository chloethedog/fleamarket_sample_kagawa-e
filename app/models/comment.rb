class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  validates :text, presence: true, length: { maximum: 250 ,message: 'は250文字以下で入力してください'}
end
