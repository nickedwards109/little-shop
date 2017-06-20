class Category < ApplicationRecord
  has_many :items

  validates :title, presence: true, uniqueness: true

  def self.search(search)
    where("LOWER(title) LIKE ?", "%#{search.downcase}%")
  end
end
