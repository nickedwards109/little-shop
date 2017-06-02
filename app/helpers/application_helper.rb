module ApplicationHelper
  def current_admin?
    current_user && current_user.admin?
  end

  def user_is_authenticated?
    !session[:user_id].nil?
  end
end
