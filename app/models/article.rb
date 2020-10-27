class Article < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :image
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :category_id, numericality: { other_than: 1 } 



end
