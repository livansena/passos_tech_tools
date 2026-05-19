class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  stale_when_importmap_changes

  before_action :set_cart_count

  private

  def set_cart_count
    cart = Cart.first
    @cart_count = cart ? cart.cart_items.sum(:quantity) : 0
  end
end