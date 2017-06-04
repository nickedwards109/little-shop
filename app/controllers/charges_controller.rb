class ChargesController < ApplicationController
  before_action :set_order_amount

  def new
  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount_cents,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  unless Stripe::CardError
    #make a new order in the database
    #redirect to path for OrdersController#create
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def set_order_amount
    @amount_dollars = @cart.total_dollar_amount
    @amount_cents = @amount_dollars * 100
  end
end
