class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :cart_count

  private

  def cart_count
    if current_user
      @cart_count = current_user.carted_products.where(status: "Carted").count
    else 
      @cart_count = 0
    end
  end

  def authenticate_admin!
      redirect_to "/" unless current_user && current_user.admin
  end

end
