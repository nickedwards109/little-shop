class Category < ApplicationRecord
  has_many :items

  validates :title, presence: true, uniqueness: true

  def search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
