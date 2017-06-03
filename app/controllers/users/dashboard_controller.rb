class Users::DashboardController < AuthenticateUserController
  def home
    @user = User.find(session[:user_id])
  end
end