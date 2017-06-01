class Admin::ItemsController < AuthenticateAdminController
  
  def index
    @items = Item.all
  end
end