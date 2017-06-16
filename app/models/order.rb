class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  validates :status, presence: true

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def add_items(cart)
    cart.map do |item, quantity|
      item = Item.find(item)
      quantity.times do
        self.items.append(item)
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
