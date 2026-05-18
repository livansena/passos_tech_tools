class CartItemsController < ApplicationController

  def create
    cart = Cart.first || Cart.create

    product = Product.find(params[:product_id])

    cart_item = cart.cart_items.find_by(product: product)

    if cart_item
      cart_item.quantity += 1
      cart_item.save
    else
      cart.cart_items.create(
        product: product,
        quantity: 1
      )
    end

    redirect_to cart_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy

    redirect_to cart_path
  end

end