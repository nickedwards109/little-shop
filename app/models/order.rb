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

  def add_items(cart)
    cart.map do |item, quantity|
      quantity.times do
        self.items.append(Item.find(item))
      end
    end
  end

  def contained_items
    items.each_with_object(Hash.new(0)) do |item, collection|
      collection[item] += 1
    end
  end

  def total_price
    self.items.sum(:price)
  end
end
