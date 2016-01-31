class ProductsController < ApplicationController

  # def individual
  #   @product = Product.first
  # end

  def index
    @products = Product.all
      if params[:sort]
        @products = Product.order(:price)
      end
      if params[:most]
        @products = Product.order(price: :desc)
      end

      # if params[:sort] && params[:most]
      #   @products = Product.order(params[:sort] => params[:most])
      # end

      if params[:discount]
        @products = Product.where("price<?", 2)
      end

      if params[:category]
        @products = Category.find_by(name: params[:category]).products
      end

  end

   def show
    @product = Product.find_by(id: params[:id])
    @supplier = Supplier.find_by(id: @product.supplier_id)
  end

  def new
  end

  def create 
    @product = Product.create({name: params[:name], price: params[:price], supplier_id: params[:supplier][:supplier_id], description: params[:description]})

    Image.create(url: params[:image], product_id: @product.id) if params[:image] != ""
    
    flash[:success]= "New Product Created"
    redirect_to '/products'
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.update({name: params[:name], price: params[:price], description: params[:description]})

    Image.create(url: params[:image], product_id: @product.id) if params[:image] != ""

    flash[:success] = "Producted Update!"
    redirect_to "/products/#{@product.id}"

  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:warning] = "Item Gone!"
    redirect_to "/products@bn"
  end


  def random
    @product = Product.all.sample

    render :show
  end

  def search
    @products = Product.where('name LIKE ? OR description LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")

    render :index
  end

end
