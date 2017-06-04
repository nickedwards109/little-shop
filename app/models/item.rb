class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, :description, :price, :inventory_status, presence: true
  validates :title, uniqueness: true

  enum inventory_status: ["in-stock", "out-of-stock", "retired"]

  def self.retired?
    self.inventory_status == 'retired' ? true : false
  end
end
