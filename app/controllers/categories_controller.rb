
class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
    @items = @items.paginate(:page => params[:page], :per_page => 16)
  end
end
