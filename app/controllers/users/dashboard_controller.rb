class Users::DashboardController < AuthenticateUserController
  
  def home
    @user = session[:user_id]
  end
end