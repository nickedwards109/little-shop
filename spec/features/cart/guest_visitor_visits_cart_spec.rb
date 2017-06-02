require 'rails_helper'

RSpec.describe "Cart" do
  scenario "unauthenticated visitor visits the cart" do
    item = create(:item, title: "Bespoke Beard Oil Brush")

    visit items_path
    within(".item_#{item.id}") do
      click_button "Add to Cart"
    end

    visit cart_path
    expect(page).to have_content("Login or Register to Checkout")
    click_on "Login or Register to Checkout"
    click_on "Create Account"
    fill_in "Name", with: "TestName"
    fill_in "Username", with: "TestUsername"
    fill_in "Password", with: "TestPassword"
    click_on "Create Account"
    fill_in "Username", with: "TestUsername"
    fill_in "Password", with: "TestPassword"
    click_on "Submit Login"
    visit cart_path
    expect(page).not_to have_content("Login or Register to Checkout")
    expect(page).to have_content("Checkout")
    expect(page).to have_content(item.title)
  end
end
