class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  before_save { email.downcase! }

  has_one :delivery
  has_one :card 
  has_many :items, class_name: 'Item', foreign_key: "seller_id"
  has_many :items, class_name: 'Item', foreign_key: "buyer_id"

  validates :email, uniqueness: { case_sensitive: false, message: 'は既に登録されています。' }, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/, message: 'は＠とドメインを含む必要があります'}
                    
  validates :password, confirmation: { message: 'パスワードが間違っています。'  }
  validates :password, length: { in: 7..126,message: 'は7文字以上126文字以下で入力してください'}

  with_options presence: {message: 'は空で入力しないでください。'} do
    validates :nickname
    validates :birthday
    validates :email
    validates :password
    validates :last_name
    validates :first_name
    validates :first_name_ruby
    validates :last_name_ruby
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください'} do
    validates :last_name
    validates :first_name
  end
  
  with_options format: { with: /\A[ぁ-ん-]+\z/, message: 'に全角ひらがなを使用してください'} do
    validates :last_name_ruby
    validates :first_name_ruby
  end

  has_many :items, class_name: 'Item', foreign_key: "seller_id"
  has_many :items, class_name: 'Item', foreign_key: "buyer_id"
end
