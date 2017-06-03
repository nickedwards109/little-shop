class Users::OrdersController < AuthenticateUserController
  
  def index
    @user = User.find(session[:user_id])
    @orders = @user.orders
  end

  def show
    @user = User.find(session[:user_id])
    @order = Order.find(params[:id])
  end
end
