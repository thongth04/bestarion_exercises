class Category < ApplicationRecord
  has_many :products

  validates :category_tag, inclusion: { in: %w(drink food others), message: "%{value} is not a valid value" }

end
