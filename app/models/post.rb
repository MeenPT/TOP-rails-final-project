class Post < ApplicationRecord
  SUPPORTED_IMAGES_FORMATS = [ "image/png", "image/jpeg", "image/webp" ].freeze

  belongs_to :user
  has_one :profile, through: :user

  has_many_attached :images

  validates_associated :user
  validates :title, presence: true
  validates :images,
            limit: { max: 5 },
            content_type: SUPPORTED_IMAGES_FORMATS,
            size: { less_than_or_equal_to: 8.megabytes }
end
