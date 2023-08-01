class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end
  
  def show
    p params['id'] # == 2
    @product = Product.find_by(id: params['id'])
    render template: "products/show"
  end

  # def comb
  #   @product = Product.find_by(id: 3)
  #   render template: "products/show"
  # end

  # def sandals
  #   @product = Product.find_by(id: 2)
  #   render template: "products/show"
  # end
end
