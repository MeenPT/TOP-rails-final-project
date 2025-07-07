class Profile < ApplicationRecord
  belongs_to :user

  validates_associated :user
  validates :display_name, presence: true
end
