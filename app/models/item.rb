class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, :description, :price, :stock_status, presence: true
  validates :title, uniqueness: true
end
