class Comment < ApplicationRecord
  belongs_to :post

  validates :author_name, presence: true, length: { maximum: 60 }
  validates :body, presence: true
end
