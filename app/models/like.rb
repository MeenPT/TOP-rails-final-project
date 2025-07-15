class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_associated :user
  validates_associated :post
end
