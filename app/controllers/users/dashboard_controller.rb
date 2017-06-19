class Users::DashboardController < AuthorizedUserController
  def home
    @user = User.find(session[:user_id])
  end
end