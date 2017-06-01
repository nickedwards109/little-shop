require 'rails_helper'

RSpec.feature "Cart" do
  scenario "user visits the cart page" do
    item_1 = create(:item, title: "Bespoke Beard Oil Brush")
    item_2 = create(:item)

    visit items_path
    within(".item_#{item_1.id}") do
      click_button "Add to Cart"
    end
    within(".item_#{item_1.id}") do
      click_button "Add to Cart"
    end
    within(".item_#{item_2.id}") do
      click_button "Add to Cart"
    end

    click_on "Cart (3)"
    expect(page).to have_current_path(cart_path)
    expect(page).to have_content("#{item_1.title}")
    expect(page).to have_content("#{item_1.description}")
    expect(page).to have_content("#{item_1.price}")

    item_1_subtotal = item_1.price * 2
    item_2_subtotal = item_2.price
    total = item_1_subtotal + item_2_subtotal
    expect(page).to have_content("Subtotal: #{item_1_subtotal}")
    expect(page).to have_content("Total: #{total}")
  end
end
