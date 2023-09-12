class ProductsController < ApplicationController

  # before_action :authenticate_admin, except: [:index, :show]
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  
  def index
    # find the category, then find all the products for that category
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    else
      @products = Product.all
      render :index
    end
      
  end

  # def index
  #   # find the category, then find all the products for that category
  #   category = Category.find_by(id: params[:category_id])
  #   @products = category.products
  #   render :index
  # end
  
  def create
    @product = Product.new(      
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      params[:images].each do |image|
        image = Image.new(url: image, product_id: @product.id)
        image.save
      end
      render :show
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end
  
  def show
    # return one product
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def update
    # combination of show and create
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url
    @product.price = params[:price] || @product.price
    @product.save
    render :show
  end

  def destroy
    # find the product
    @product = Product.find_by(id: params[:id])
    # remove the product
    @product.destroy
    render json: {message: "product removed"}
  end
  
end
