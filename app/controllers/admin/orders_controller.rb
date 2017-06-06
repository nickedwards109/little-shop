class Admin::OrdersController < AuthenticateAdminController
  def show
    @order = Order.find(params[:id])
  end
end