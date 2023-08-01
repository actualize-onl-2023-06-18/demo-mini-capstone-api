class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: 1)
    render template: "products/show"
  end
end
