class CartedProductsController < ApplicationController

  def index

    @carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)   
    # @carted_products = current_user.carted_products.where(status: "Carted")  
  end

  def create
    CartedProduct.create(product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id, status: "Carted")
    redirect_to "/carted_products"
  end

end
