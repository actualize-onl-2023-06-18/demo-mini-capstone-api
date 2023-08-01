class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end
  
  def show
    @product = Product.find_by(id: 1)
    render template: "products/show"
  end
end
