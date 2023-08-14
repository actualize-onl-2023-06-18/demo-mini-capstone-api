class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    # orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render :index
  end
  
  def create
    @order = Order.new(
      user_id: 2, 
      subtotal: 590, 
      tax: 590 * 0.09, 
      total: (590 * 0.09) + 590
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
