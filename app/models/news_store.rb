class NewsStore < ApplicationRecord


  with_options presence: true do
    validates :title
    validates :url
    validates :category
  end

end
