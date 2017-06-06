class CategoriesController < ApplicationController
  def index
    if params[:search]
      @categories = Category.search(params[:search].capitalize)
      redirect_to items_path, notice: 'Unable to find Category' if @categories.empty?
    end
  end

  def show
      @category = Category.find(params[:id])
      @items = @category.items.paginate(:page => params[:page], :per_page => 16)
  end
end
