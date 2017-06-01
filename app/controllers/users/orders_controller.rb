class Users::OrdersController < AuthenticateUserController
  
  def index
    @user = User.find(session[:user_id])
  end
end