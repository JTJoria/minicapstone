class CartedProductsController < ApplicationController

  def index
    if user_signed_in? && current_user.carted_products.where(status: "Carted").any?
      @carted_products = current_user.carted_products.where(status: "Carted")     
    else
      flash[:warning] = "You should try adding products to your cart."
      redirect_to "/"
    end  
  end

  def create
    CartedProduct.create(product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id, status: "Carted")

    flash[:success] = "You've added a product to your cart."
    redirect_to "/carted_products"
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "Removed")

    redirect_to "/carted_products"
  end

end

# @carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)