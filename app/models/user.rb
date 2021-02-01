class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  has_one :delivery
  has_one :card 
  has_many :items

  validates :email, uniqueness: { case_sensitive: false, message: 'は既に登録されています。' }, format: { with: /\A\S+@\S+\.\S+\z/, message: 'は＠とドメインを含む必要があります'}
                    
  validates :password, confirmation: { message: 'パスワードが間違っています。'  }
  validates :password, :password_confirmation ,length: { minimum: 7,message: "は7文字以上で入力してください"}

  with_options presence: {message: 'は空で入力しないでください。'} do
    validates :nickname
    validates :birthday
    validates :email
    validates :password
    validates :password_confirmation
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

end
