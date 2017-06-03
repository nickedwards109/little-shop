class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  validates :status, presence: true

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def add_item(item)
    self.items.append(item)
  end

  def add_item_by_id(item_id)
    self.items.append(Item.find(item_id))
  end

  def tabulated_orders
    self.items
  end
  
end
