class AddItemQuantityToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :item_quantity, :integer
  end
end
