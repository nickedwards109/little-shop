class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart, :set_categories

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def set_categories
    @categories = Category.all
  end
end
