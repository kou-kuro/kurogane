class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :firstname
          validates :lastname
          validates :firstname_kana
          validates :lastname_kana
         end

         # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         # validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

         with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '全角文字を使用してください' } do
           validates :password, confirmation: true, unless: -> { password.blank? }
         end

         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
           validates :firstname
           validates :lastname
         end

         with_options presence: true, format: { with: /\A^([ァ-ン]|ー)+$\z/ } do
           validates :firstname_kana
           validates :lastname_kana
         end

         has_many :articles, dependent: :destroy
         has_many :favorite_articles, through: :favorites
         has_many :favorites
         def favorited_by?(article_id)
          favorites.where(article_id: article_id).exists?
         end
      
end
