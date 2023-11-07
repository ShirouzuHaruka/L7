class CartsController < ApplicationController
  def show
    @cartItems = current_cart.cart_items
    @total_price = 0
    @cartItems.each do |item|
      @total_price += item.product.price * item.qty
    end
  end
end
