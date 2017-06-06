class Category < ApplicationRecord
  has_many :items

  validates :title, presence: true, uniqueness: true

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
