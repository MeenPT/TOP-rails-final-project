class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_associated :user
  validates_associated :post
  validates :post, uniqueness: { scope: :user, message: "already liked the post" }
end
