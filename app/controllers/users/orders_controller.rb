class Users::OrdersController < AuthenticateUserController
  
  def index
    @user = User.find(session[:user_id])
    @orders = @user.orders
  end

  def show
    @user = User.find(session[:user_id])
    @order = Order.find(params[:id])
  end

  def create
    Order.create(user_id: session[:user_id])
    Order.last.add_items(@cart.contents)
    session[:cart] = {}
    redirect_to order_path(Order.last)
  end

  def checkout
    @user = User.find(session[:user_id])
  end
end
