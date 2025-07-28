class Micropost < ApplicationRecord
  MAX_IMAGE_SIZE = 5.megabytes
  MICROPOST_PERMIT = %i(content image).freeze

  belongs_to :user
  has_one_attached :image

  scope :newest, ->{order(created_at: :desc)}

  validates :content, presence: true,
                      length: {maximum: Settings.digits.DIGIT_140}

  validates :image,
            content_type: {in: %w(image/jpeg image/gif image/png),
                           message: :invalid_image_format},
            size: {less_than: MAX_IMAGE_SIZE,
                   message: :image_size_too_large}

  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end
end
