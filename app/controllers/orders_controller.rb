class OrdersController < ApplicationController
  def confirmation
    @order = Order.find(params[:order_id])
  end
end