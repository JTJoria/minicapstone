class CartedProductsController < ApplicationController

    def new
      if user.status = "Carted"
        user.products
      end
    end

    def create
    price = Product.find(params[:product_id]).price
    

    @carted_product = carted_product.new({quantity: params[:quantity], product_id: params[:product_id], user_id: current_user.id, status: "Carted")
    @carted_product.subtotal = @carted_product.calc_subtotal(price)
    @carted_product.tax      = @carted_product.calc_tax(0.09)
    @carted_product.total    = @carted_product.calc_total

    @carted_product.save

    redirect_to "/carted_products/#{@carted_product.id}"
  end

end
