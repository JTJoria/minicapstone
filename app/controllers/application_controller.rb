class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :cart_count

  private

  def cart_count
    @cart_count = current_user.carted_products.where(status: "Carted").count
  end

end
