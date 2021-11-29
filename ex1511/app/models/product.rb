class Product < ApplicationRecord
  has_many :sizings, dependent: :destroy
  has_one_attached :image

  attribute :price, default: 0
  attribute :quantity, default: 0

  VALID_CATEGORIES = ['Drinks', 'Foods', 'Others']

  validates :sku, presence: true, uniqueness: true
  validates :title, presence: true, length: {minimum: 5, maximum:40}
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, inclusion: { in: VALID_CATEGORIES }


  def self.search(term)
    # byebug
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end

  def self.filter(tag)
    if tag
      where(category: tag)
    else
      all
    end
  end

  def self.fill_out_attr
    products = Product.all
    for product in products
      product[:product_type] = "drink"
      product.save
    end
  end

end
