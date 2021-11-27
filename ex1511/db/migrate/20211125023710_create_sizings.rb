class CreateSizings < ActiveRecord::Migration[6.1]
  def change
    create_table :sizings do |t|
      t.string :size_tag
      t.integer :quantity
      t.integer :product_id

      t.timestamps
    end
  end
end
