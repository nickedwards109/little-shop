class Admin::DashboardController < AuthenticateAdminController
  
  def home
    @user = User.find(session[:user_id])
  end
end