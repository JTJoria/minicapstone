class CartedProductsController < ApplicationController

  before_action :authenticate_user!

  def index
    if user_signed_in? && current_user.carted_products.where(status: "Carted").any?
      @carted_products = current_user.carted_products.where(status: "Carted")     
    else
      flash[:warning] = "You should try adding products to your cart."
      redirect_to "/"
    end  
  end

  def create
      @carted_product = CartedProduct.create(product_id: params[:product_id], quantity: params[:quantity], user_id: current_user.id, status: "Carted")
      @product = Product.find(params[:product_id])
    if carted_product.save
      session[:cart_count] = nil 
      
      flash[:success] = "You've added a product to your cart."
      redirect_to "/carted_products"
    else
      render "/products/show"
    end
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "Removed")
    session[:cart_count] = nil 
    redirect_to "/carted_products"
  end

end

# @carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)