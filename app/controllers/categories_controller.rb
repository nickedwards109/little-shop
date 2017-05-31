class CategoriesController < ApplicationController
  def index
    @categories = Categories.all
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end
end
