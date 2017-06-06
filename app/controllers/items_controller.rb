class ItemsController < ApplicationController
  def index
    if params[:search]
      @items = Item.search(params[:search].capitalize)
                   .order('created_at DESC')
                   .paginate(page: params[:page], per_page: 16)
    else
      @items = Item.paginate(:page => params[:page], :per_page => 16)
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
end
