class Users::DashboardController < AuthorizedUserController
  def home
    @user = current_user
  end
end