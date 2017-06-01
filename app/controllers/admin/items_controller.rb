class Admin::ItemsController < AuthenticateAdminController
  
  def index
    @items = Item.paginate(:page => params[:page], :per_page => 16)
  end
end