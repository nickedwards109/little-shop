class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    id = params[:item_id].to_s
    item = Item.find(id)
    session[:cart] ||= {}
    session[:cart][id] = (session[:cart][id] || 0) + 1
    flash[:notice] = "Your cart now contains #{pluralize(session[:cart][id], item.title)}."
    redirect_to items_path
  end

  def show
  end

  def destroy
    id = params[:item_id].to_s
    item = Item.find(id)
    @cart.contents.delete(id)
    item_link = "#{view_context.link_to(item.title, item_path(item))}"
    flash[:success] = "Successfully removed #{item_link} from your cart."
    redirect_to cart_path
  end

  def decrement
    id = params[:item_id].to_s
    item = Item.find(id)
    @cart.contents[id] -= 1
    redirect_to cart_path
  end

  def increment
    id = params[:item_id].to_s
    item = Item.find(id)
    @cart.contents[id] += 1
    redirect_to cart_path
  end
end
