class RemoveColsFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :quantity, :integer
    remove_column :orders, :product_id, :integer
  end
end
