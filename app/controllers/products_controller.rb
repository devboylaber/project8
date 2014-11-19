class ProductsController < ApplicationController
   #modified
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
end