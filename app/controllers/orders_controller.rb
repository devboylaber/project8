class OrdersController < ApplicationController
  # before_action :initialize_order_events
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end


  # POST /orders
  # POST /orders.json
  def create
    @order_info = current_order
    @order = @order_info.orders.new(order_params)
    @order_info.save
    session[:order_id] = @order.id
  end

  def update
    @order_info = current_order
    @order = @order_info.orders.find(params[:id])
    @order.update_attributes(order_params)
    @orders = @order_info.orders
  end

  def destroy
    @order_info = current_order
    @order = @order_info.orders.find(params[:id])
    @order.destroy
    @orders = @order.orders
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:product_id, :order_id, :unit_price, :quantity, :total_price, :user_id, :admin_id, :stripe_customer_token)
    end
end
