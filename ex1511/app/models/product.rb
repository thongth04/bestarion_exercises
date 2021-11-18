class Product < ApplicationRecord

  validates :sku, presence: true, uniqueness: true
  validates :title, presence: true, length: {minimum: 5, maximum:40}
  validates :price, presence: true
  validates :quantity, presence: true

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
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
