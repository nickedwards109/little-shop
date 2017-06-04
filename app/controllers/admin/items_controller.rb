class Admin::ItemsController < AuthenticateAdminController
  before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.paginate(:page => params[:page], :per_page => 16)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_items_path, notice: 'Item Created'
    else
      flash[:item] = 'Unable to Create Item'
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to admin_items_path, notice: 'Item Updated'
    else
      flash[:notice] = 'Item Not Updated'
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category_id, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
