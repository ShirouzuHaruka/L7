class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    render "new"
  end
  
  def create
    product_name = params[:name]
    product_price = params[:price]
    product = Product.new(name: product_name, price: product_price)
    if product.save
      #次のページで表示
      flash[:notice] = "商品が追加されました。"
      redirect_to root_path
    else
      #現在のページで表示
      flash.now[:alert] = "商品の追加時にエラーが発生しました。もう一度追加してください。"
      render "new"
    end
  end
  
  def destroy
    delete_product = Product.find(params[:id])
    delete_product.destroy
    redirect_to root_path
  end
end
