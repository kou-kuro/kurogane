class Article < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :image
  end

  has_many :favorites
  # belongs_to :user, through: :favorite, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  has_many :favorited_users, through: :favorites, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :category_id, numericality: { other_than: 1 } 



end
