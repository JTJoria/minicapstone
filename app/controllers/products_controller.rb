class ProductsController < ApplicationController

  def individual
    @product = Product.first
  end

  def all
    @products = Product.all
  end

end
