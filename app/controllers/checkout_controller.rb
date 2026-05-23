class CheckoutController < ApplicationController
  def index
    @cart = Cart.first

    @subtotal = @cart ? @cart.cart_items.sum do |item|
      item.product.price * item.quantity
    end : 0

    @shipping = @subtotal > 0 ? 8.90 : 0
    @total = @subtotal + @shipping
  end

  def create
    @cart = Cart.first

    @subtotal = @cart.cart_items.sum do |item|
      item.product.price * item.quantity
    end

    @shipping = @subtotal > 0 ? 8.90 : 0
    @total = @subtotal + @shipping

    @order = Order.create(
      full_name: params[:full_name],
      email: params[:email],
      shipping_address: params[:shipping_address],
      payment_method: params[:payment_method],
      country: params[:country],
      postal_code: params[:postal_code],
      city: params[:city],
      subtotal: @subtotal,
      shipping: @shipping,
      total: @total
    )

    @cart.cart_items.each do |item|
  OrderItem.create(
    order: @order,
    product: item.product,
    quantity: item.quantity,
    price: item.product.price
  )
end
    @cart.cart_items.destroy_all
    
    redirect_to orders_confirmation_path(order_id: @order.id)
  end

  private

  def order_params
    params.permit(
      :full_name,
      :email,
      :shipping_address,
      :payment_method,
      :country,
      :postal_code,
      :city
    )
  end
end