class ImagesController < ApplicationController

  before_action :authenticate_admin!



   def create 
     
    @image = Image.new({url: params[:url], product_id: @product_id })

    if @image.save
      @image = Image.create(url: params[:image], product_id: @product.id) if params[:image] != ""

      flash[:success]= "New Product Created"
      redirect_to "/products/#{@product.id}"
    else
      render "/images/new"
    end
  end

end
