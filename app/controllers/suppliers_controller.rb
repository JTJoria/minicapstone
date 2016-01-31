class SuppliersController < ApplicationController

def index
  @suppliers = Suppliers.new
end

def new

end

def create
  @supplier = Supplier.create({name: params[:name], email: params[:email], phone: params[:phone]})
  redirect_to "/suppliers/#{@supplier.id}"
end

def show
  @supplier = Supplier.find(params[:id])
end

def edit
  @supplier = Supplier.find(params[:id])
end

def update
  @supplier = Supplier.find(params[:id])
  @supplier.update({name: params[:name], email: params[:email], phone: params[:phone]})
  redirect_to "/suppliers/#{@supplier.id}"
end

def destroy
  supplier = Supplier.find(params[:id])
  supplier.destroy
  redirect_to "/products"
end

end