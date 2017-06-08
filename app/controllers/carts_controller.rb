class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    id = params[:item_id].to_s
    item = Item.find(id)
    session[:cart] ||= {}
    session[:cart][id] = (session[:cart][id] || 0) + 1
    flash[:notice] = "Your cart now contains #{pluralize(session[:cart][id], item.title)}."
    redirect_to request.referrer
  end

  def show
  end

  def update
    @cart.change_quantity(params[:item_id], params[:quantity_change])
    redirect_to cart_path
  end

  def destroy
    id = params[:item_id].to_s
    item = Item.find(id)
    @cart.contents.delete(id)
    item_link = "#{view_context.link_to(item.title, item_path(item))}"
    redirect_to request.referrer, notice: "Successfully removed #{item_link} from your cart."
  end
end
