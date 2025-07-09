class Profile < ApplicationRecord
  SUPPORTED_AVATAR_FORMATS = [ "image/png", "image/jpeg", "image/webp" ].freeze
  belongs_to :user

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
  end

  validates_associated :user
  validates :display_name, presence: true
  validates :avatar,
            limit: { max: 1 },
            content_type: SUPPORTED_AVATAR_FORMATS,
            size: { less_than_or_equal_to: 10.megabytes }
end
