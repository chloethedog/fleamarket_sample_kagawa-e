class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :delivery
  has_one :card 
  has_many :items

  validates :nickname, :birthday ,presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A\S+@\S+\.\S+\z/, message: 'は＠とドメインを含む必要があります'}
                    
  validates :password, confirmation: true
  validates :password, :password_confirmation ,presence: true ,length: { minimum: 7 }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください'} do
    validates :last_name
    validates :first_name
  end
  
  with_options presence: true, format: { with: /\A[ぁ-ん-]+\z/, message: 'に全角ひらがなを使用してください'} do
    validates :last_name_ruby
    validates :first_name_ruby
  end

end
