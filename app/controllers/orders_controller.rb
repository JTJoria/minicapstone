class OrdersController < ApplicationController

  before_action :authenticate_user!

  def create
    carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)

    order = Order.create(user_id: current_user.id)

    carted_products.each do |carted_product|
      carted_product.update(order_id: order.id, status: "Purchased")
    end

    order.calculate_totals
    
    session[:cart_count] = nil 
    flash[:success] = "Your order is complete"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find(params[:id])

    if current_user.id != @order.user_id
      redirect_to "/"
    end
  end
end