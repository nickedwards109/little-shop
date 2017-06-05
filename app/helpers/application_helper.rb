module ApplicationHelper
  def user_is_authenticated?
    !session[:user_id].nil?
  end
end
