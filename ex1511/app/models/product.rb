class Product < ApplicationRecord

  validates :sku, presence: true
  validates :title, presence: true, length: {minimum:10, maximum:40}
  validates :price, presence: true
  validates :quantity, presence: true



  # def find_by_name(name)
  #   products.select { |product| name == product.name }
  # end

  # def self.fill_out_attr
  #   products = Product.all
  #   i = 0
  #   for product in products
  #     product[:sku] = "SP1000" + i.to_s
  #     product[:quantity] = 40
  #     product.save
  #     i += 1
  #   end
  # end

end
