class CartsController < ApplicationController
  def show
    @cart = Cart.first
  end
end