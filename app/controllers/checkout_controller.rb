class CheckoutController < ApplicationController
  def index
    @cart = Cart.first

    @total = @cart ? @cart.cart_items.sum { |item| item.product.price * item.quantity } : 0
  end
end