class CreateSizings < ActiveRecord::Migration[6.1]
  def change
    create_table :sizings do |t|
      t.string :size_tag
      t.integer :quantity
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
