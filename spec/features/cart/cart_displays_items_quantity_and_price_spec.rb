require 'rails_helper'

RSpec.feature "Cart" do
  scenario "user adds items to cart and wishes to see the price totals" do
    item_1 = create(:item, price: 2.00)
    item_2 = create(:item, price: 1.00)

    visit items_path
    within(".item_#{item_1.id}") do
      2.times do
        click_button "Add to Cart"
      end
    end

    within(".item_#{item_2.id}") do
      click_button "Add to Cart"
    end

    click_on "Cart (3)"
    
    expect(page).to have_current_path(cart_path)
    expect(page).to have_content("#{item_1.title}")
    expect(page).to have_content("#{item_1.description}")
    expect(page).to have_content("#{item_1.price}")
    expect(page).to have_content("Subtotal: $4.00")
    expect(page).to have_content("Total: $5.00")
  end
end
