class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

  validates :author_name, presence: true, length: { maximum: 60 }, unless: :user
  validates :body, presence: true
end

