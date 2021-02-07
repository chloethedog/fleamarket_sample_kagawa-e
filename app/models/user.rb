class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :delivery
  has_one :card
  has_many :items, foreign_key: :seller_id
  has_many :items, foreign_key: :purchase_id 
end
