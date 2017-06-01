class Admin::ItemsController < AuthenticateAdminController
  
  def index
    @items = Item.paginate(:page => params[:page], :per_page => 16)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(items_param)

    if @item.save
      flash[:item] = 'Item Updated'
      redirect_to admin_items_path
    else
      flash[:item] = 'Item Not Updated'
      render :edit
    end
  end

  private

  def items_param
    params.require(:item).permit(:title, :description, :price)
  end
end