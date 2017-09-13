class AddPhotosColumnToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :Products, :image_url, :string
  end
end
