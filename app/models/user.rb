class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, length: {minimum: 2, maximum: 20}
  
  has_many :orders
  has_many :carted_products
end
