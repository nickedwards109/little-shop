class Users::OrdersController < AuthorizedUserController

  def index
    @user = User.find(session[:user_id])
    @orders = @user.orders
  end

  def show
    @user = User.find(session[:user_id])
    @order = Order.find(params[:id])
  end

  # Creating a new order is handled by the Stripe ChargesController

  def checkout
    @user = User.find(session[:user_id])
  end
end
