class ChargesController < ApplicationController
  before_action :set_order_amount

  def new
  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount_in_cents.to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    create_order
    reset_cart
    redirect_to order_path(Order.last)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  private

  def create_order
    Order.create(user_id: session[:user_id])
    Order.last.add_items(@cart.contents)
  end

  def reset_cart
    session[:cart] = {}
  end

  def set_order_amount
    amount = @cart.total_dollar_amount
    @amount_in_cents = amount * 100
  end
end
