class AddProductIdToSizings < ActiveRecord::Migration[6.1]
  def change
    add_column :sizings, :product_id, :int
  end
end
