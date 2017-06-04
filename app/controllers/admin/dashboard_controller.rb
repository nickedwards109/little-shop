class Admin::DashboardController < AuthenticateAdminController
  
  def home
    @user = User.find(session[:user_id])
    if params["Order Status"]
      @orders = Order.where(status: params["Order Status"])
    else
      @orders = Order.all 
    end
  end
end