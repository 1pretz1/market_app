class ChangeSellerIdFromProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :Products, :seller_id, :user_id
  end
end
