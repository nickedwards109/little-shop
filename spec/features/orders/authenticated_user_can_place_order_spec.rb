require 'rails_helper'

RSpec.feature 'Placing an order' do
  # I integrated Stripe, which changes the behavior expected by these tests.
  # However, I have not figured out how to feature test the Stripe checkout.
  # So, for now, I am leaving comments in place of actual expectations,
  # and in time we can research how to access the Stripe pop-ups with Capybara
  # so that we can thoroughly test the checkout.
  # I have manually tested the checkout and it works as expected. -Nick 6/4/17

  before :each do
    user = create(:user)
    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')
  end

  scenario 'authenticated user adds an item in the cart and can create an order' do
    item1 = create(:item)

    visit items_path
    within(".item_#{item1.id}") do
      click_button 'Add to Cart'
    end

    click_on 'Cart (1)'
    expect(page).to have_current_path(cart_path)

    click_button 'Checkout'
    # Fill in credit card information in Stripe pop-up
    # Click on the Pay button
    # expect(page).to have_current_path(order_path(Order.last))
    # expect(page).to have_content(item1.title)
    # expect(page).to have_content("x1")
    # expect(page).to have_content(item1.price)
    # expect(page).to have_content("Order Status: #{Order.last.status.capitalize}")
  end

  scenario 'authenticated user adds multiple items to the cart and creates an order with all items' do
    item1 = create(:item)
    item2 = create(:item)
    visit items_path

    within(".item_#{item1.id}") do
      click_button 'Add to Cart'
    end

    within(".item_#{item2.id}") do
      click_button 'Add to Cart'
    end

    click_on 'Cart (2)'
    expect(page).to have_current_path(cart_path)

    click_button 'Checkout'
    # Fill in credit card information in Stripe pop-up
    # Click on the Pay button
    # expect(page).to have_current_path(order_path(Order.last))
    # expect(page).to have_content(item1.title)
    # expect(page).to have_content('x1')
    # expect(page).to have_content(item1.price)
    # expect(page).to have_content(item2.title)
    # expect(page).to have_content('x1')
    # expect(page).to have_content(item2.price)
    # expect(page).to have_content("Order Status: #{Order.last.status.capitalize}")
  end

  scenario 'authenticated user adds multiple of the same item to the cart and creates an order with all the items' do
    item1 = create(:item)

    visit items_path
    within(".item_#{item1.id}") do
      click_button 'Add to Cart'
      click_button 'Add to Cart'
      click_button 'Add to Cart'
    end

    click_on 'Cart (3)'
    expect(page).to have_current_path(cart_path)

    click_button 'Checkout'
    # Fill in credit card information in Stripe pop-up
    # Click on the Pay button
    # expect(page).to have_current_path(order_path(Order.last))
    # expect(page).to have_content(item1.title)
    # expect(page).to have_content("x3")
    # expect(page).to have_content((item1.price)*3)
    # expect(page).to have_content("Order Status: #{Order.last.status.capitalize}")
  end
end
