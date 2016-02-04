class OrdersController < ApplicationController

  def create
    carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)

    order = Order.create(user_id: current_user.id)

    carted_products.each do |carted_product|
      carted_product.update(order_id: order.id, status: "Purchased")
    end

    order.calculate_totals

    flash[:success] = "Your order is complete"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find(params[:id])
  end
end