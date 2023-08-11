class Category < ApplicationRecord
  has_many :category_products

  def products
    # get to join table
    category_products.each do |cp|
      p cp.product
    end
    # go to each, find product_id, find the right product
  end
end
