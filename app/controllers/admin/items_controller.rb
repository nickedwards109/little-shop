class Admin::ItemsController < AuthenticateAdminController
  
  def index
    @items = Item.paginate(:page => params[:page], :per_page => 16)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:item] = 'Item Created'
      redirect_to admin_items_path
    else
      flash[:item] = 'Unable to Create Item'
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)

    if @item.save
      flash[:item] = 'Item Updated'
      redirect_to admin_items_path
    else
      flash[:item] = 'Item Not Updated'
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price)
  end
end