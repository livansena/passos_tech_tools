class AdminController < ApplicationController
  def orders
    @orders = Order.order(created_at: :desc)
  end
end