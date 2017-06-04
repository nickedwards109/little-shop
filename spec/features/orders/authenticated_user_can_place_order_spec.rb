require 'rails_helper'

RSpec.feature 'Placing an order' do
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
    
    click_button 'Place Order!'
    expect(page).to have_current_path(order_path(Order.last))
    expect(page).to have_content(item1.title)
    expect(page).to have_content("x1")
    expect(page).to have_content(item1.price)
    expect(page).to have_content("Order Status: #{Order.last.status.capitalize}")
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
    
    click_button 'Place Order!'
    expect(page).to have_current_path(order_path(Order.last))
    expect(page).to have_content(item1.title)
    expect(page).to have_content('x1')
    expect(page).to have_content(item1.price)
    expect(page).to have_content(item2.title)
    expect(page).to have_content('x1')
    expect(page).to have_content(item2.price)
    expect(page).to have_content("Order Status: #{Order.last.status.capitalize}")
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
    
    click_button 'Place Order!'
    expect(page).to have_current_path(order_path(Order.last))
    expect(page).to have_content(item1.title)
    expect(page).to have_content("x3")
    expect(page).to have_content((item1.price)*3)
    expect(page).to have_content("Order Status: #{Order.last.status.capitalize}")
  end
end
