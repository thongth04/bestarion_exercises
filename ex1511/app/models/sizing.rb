class Sizing < ApplicationRecord
  belongs_to :product
  has_one_attached :image

  VALID_SIZE_TAGS = ['S', 'M', 'L', 'XL']

  attribute :quantity, default: 0
  validates :size_tag, inclusion: { in: VALID_SIZE_TAGS }
  validates :quantity, presence: true
  validates :image, presence: true

end
