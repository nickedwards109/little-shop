class Admin::DashboardController < AuthenticateAdminController
  
  def home
    @user = User.find(session[:user_id])
    if params["Order Status"]
      @orders = Order.where(status: params["Order Status"])
    else
      @orders = Order.all 
    end
  end

  def paid
    order = Order.find(params[:format])
    order.status = 'paid'
    order.save
    redirect_to admin_dashboard_path
  end

  def completed
    order = Order.find(params[:format])
    order.status = 'completed'
    order.save
    redirect_to admin_dashboard_path
  end

  def cancel
    order = Order.find(params[:format])
    order.status = 'cancelled'
    order.save
    redirect_to admin_dashboard_path
  end
end