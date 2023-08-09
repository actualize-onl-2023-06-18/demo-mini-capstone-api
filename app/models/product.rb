class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  
  def is_discounted?
    price <= 10    
  end

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
  
end
