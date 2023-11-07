class CartItemsController < ApplicationController
  def new
    @cartItem = CartItem.new
    puts "paramsの中身"
    puts params
    @product = Product.find(params[:product_id])
  end
  
  def create
    # @cartItem = CartItem.new(
    #   product_id: params[:product_id],
    #   cart_id: current_cart.id,
    #   qty: params[:quantity].to_i)
    @cartItem = current_cart.cart_items.build(
      product_id: params[:product_id],
      cart_id: current_cart.id,
      qty: params[:quantity].to_i)
    if @cartItem.save
      flash[:notice] = "カートに商品が登録されました。"
      redirect_to cart_path(current_cart)
    else
      flash[:alert] = "商品の登録数量は1以上でないといけません。"
      redirect_to root_path
    end
  end
  
  def destroy
    puts "destroyコントローラー起動"
    @cartItem = CartItem.find(params[:id])
    @cartItem.destroy
    puts "@cartItemの中身"
    puts @cartItem
    redirect_to root_path
  end
end
