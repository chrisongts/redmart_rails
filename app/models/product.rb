class Product < ApplicationRecord
  has_many :reviews
  has_many :users, through: :review
  has_many :carts
end
