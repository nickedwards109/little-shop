class Users::OrdersController < AuthorizedUserController

  def index
    @user = current_user
    @orders = @user.orders
  end

  def show
    @user = current_user
    @order = Order.find(params[:id])
  end

  # Creating a new order is handled by the Stripe ChargesController

  def checkout
    @user = current_user
  end
end
