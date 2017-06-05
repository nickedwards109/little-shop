class CategoriesController < ApplicationController
  def index
  end

  def show
    if params[:search]
      @category = Category.search(params[:search])
      if @category.nil?
        redirect_to items_path, notice: 'Unable to find Category'
      end
    else
      @category = Category.find(params[:id])
    end
    @items = @category.items.paginate(:page => params[:page], :per_page => 16)
  end
end
