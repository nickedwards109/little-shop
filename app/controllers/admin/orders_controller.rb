class Admin::OrdersController < AuthorizedAdminController
  def show
    @order = Order.find(params[:id])
  end
end