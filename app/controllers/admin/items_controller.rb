class Admin::ItemsController < AuthenticateAdminController
  
  def index
    @items = Item.paginate(:page => params[:page], :per_page => 16)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    binding.pry
  end
end