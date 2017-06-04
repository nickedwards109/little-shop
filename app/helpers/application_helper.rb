module ApplicationHelper
  def user_is_authenticated?
    !session[:user_id].nil?
  end

  # def display_change_button(status)
  #   case status
  # when 'paid' || 'ordered'
  #   change = 'cancel'
  #   when 'ordered'
      
  #   "button_to '#{change}', admin_change_path, method: 'get'"
  # end
end
