class RemoveSizingsImageUrl < ActiveRecord::Migration[6.1]
  def change
    remove_column :sizings, :image_url, :string
  end
end
