class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def create
    @product = Product.new(
      image_url: params[:image_url],
      name: params[:name], 
      price: params[:price], 
      description: params[:description]
    )
    @product.save
    render :show
  end
  
  def show
    # return one product
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def update
    # combination of show and create
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.description = params[:description]
    @product.image_url = params[:image_url]
    @product.price = params[:price]
    @product.save
    
    render :show
  end
  
end
