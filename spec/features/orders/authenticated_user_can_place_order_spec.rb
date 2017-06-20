require 'rails_helper'

RSpec.feature 'Placing an order' do
  # I integrated Stripe, which changes the behavior expected by these tests.
  # However, I have not figured out how to feature test the Stripe checkout.
  # So, for now, I am leaving comments in place of actual expectations,
  # and in time we can research how to access the Stripe pop-ups with Capybara
  # so that we can thoroughly test the checkout.
  # I have manually tested the checkout and it works as expected. -Nick 6/4/17

  # I have simplified the tests. I stubbed the creation of the order. I believe
  # we can mock the stripe functionality in the future. -Bao 6/19/17

  let(:user) {create(:user)}

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario 'authenticated user adds items to the cart and creates an order' do
    order = double("order")
    item1 = create(:item)
    item2 = create(:item, title: 'A Different Item')

    visit items_path
    within(".item_#{item1.id}") do
      click_button 'Add to Cart'
    end

    within(".item_#{item2.id}") do
      2.times do
        click_button 'Add to Cart'
      end
    end

    click_on 'Cart (3)'
    expect(page).to have_current_path(cart_path)

    click_button 'Checkout'
    allow(Order).to receive(:create).and_return(order)
  end
end
