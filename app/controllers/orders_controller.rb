class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    # orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render :index
  end
  
  def create
    # figure out what items are in this person's shopping cart
    # @carted_products =  current_user.carted_products.where(status: 'carted')
    @carted_products =  CartedProduct.where(status: 'carted', user_id: current_user.id)      
    # figure out how much they all cost
    calculated_subtotal = 0
    @carted_products.each do |cp|
      calculated_subtotal += cp.product.price * cp.quantity      
    end    
    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax
 
    # add all that up
    # tax + total

    # ....
    # backfill those items and change status to 'purchased'
    # change order_id to the order id
    
    @order = Order.new(
      user_id: current_user.id, 
      subtotal: calculated_subtotal, 
      tax: calculated_tax, 
      total: calculated_total
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
