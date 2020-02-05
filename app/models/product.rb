class Product < ApplicationRecord
  validates :item, :description, :price, presence: true
end
