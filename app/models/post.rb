class Post < ApplicationRecord
  belongs_to :user
  has_one :profile, through: :user

  validates_associated :user
  validates :title, presence: true
end
