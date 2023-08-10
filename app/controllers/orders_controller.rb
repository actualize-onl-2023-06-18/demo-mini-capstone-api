class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    # orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render :index
  end
  
  def create

    # subtotal == price * quantity
    product = Product.find_by(id: params[:product_id])
    # the polarized sunglasses
    calculated_subtotal = params[:quantity].to_i * product.price
    # 5000
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    
    
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    render :show    
  end
  
  def show
    @order = Order.find_by(id: params[:id])    
    if @order.user_id == current_user.id
      render :show
    else 
      render json: {}, status: :unauthorized
    end
  end
end
