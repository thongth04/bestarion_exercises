class Sizing < ApplicationRecord
  belongs_to :product
  has_one_attached :image

  # attribute :quantity, default: 0
  validates :size_tag, inclusion: { in: %w(S M L XL), message: "%{value} is not a valid value" }
end
