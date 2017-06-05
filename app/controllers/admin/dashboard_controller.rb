class Admin::DashboardController < AuthenticateAdminController
  before_action :set_order, only: [:paid, :completed, :cancel]
  
  def home
    @user = User.find(session[:user_id])
    if params["Order Status"]
      @orders = Order.where(status: params["Order Status"])
    else
      @orders = Order.all 
    end
  end

  def paid
    @order.status = 'paid'
    @order.save
    redirect_to admin_dashboard_path
  end

  def completed
    @order.status = 'completed'
    @order.save
    redirect_to admin_dashboard_path
  end

  def cancel
    @order.status = 'cancelled'
    @order.save
    redirect_to admin_dashboard_path
  end

  private

  def set_order
    @order = Order.find(params[:format])
  end
end