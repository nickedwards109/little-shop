class User < ApplicationRecord
  has_many :orders
  has_secure_password

  validates :name, :username, :password, :role, presence: true
  validates :username, uniqueness: true
end
