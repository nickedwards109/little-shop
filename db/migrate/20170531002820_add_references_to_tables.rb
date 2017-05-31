class AddReferencesToTables < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :category, index: true, foreign_key: true
    add_reference :order_items, :item, index: true, foreign_key: true
    add_reference :order_items, :order, index: true, foreign_key: true
    add_reference :orders, :user, index: true, foreign_key: true
  end
end
