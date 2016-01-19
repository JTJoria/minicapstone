class ProductsController < ApplicationController

  # def individual
  #   @product = Product.first
  # end

  def index
    @products = Product.all
  end

   def show
    @product = Product.find_by(id: params[:id])
  end

  def new
  end

  def create 
    @product = Product.create({name: params[:name], price: params[:price], image: params[:image], description: params[:description]})

    flash[:success]= "New Product Created"
    redirect_to '/products'
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.update({name: params[:name], price: params[:price], image: params[:image], description: params[:description]})
    flash[:success] = "Producted Update!"
    redirect_to "/products/#{@product.id}"

  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:warning] = "Item Gone!"
    redirect_to "/products@bn"
  end

end
