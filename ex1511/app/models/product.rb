class Product < ApplicationRecord
  has_many :sizings, dependent: :destroy

  # attribute :price, default: 0
  # attribute :quantity, default: 0

  VALID_CATEGORIES = ['Drink', 'Food', 'Others']

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
      product[:sku] = "SP1000" + product[:id].to_s
      product[:quantity] = 40
      product.save
    end
  end

end
