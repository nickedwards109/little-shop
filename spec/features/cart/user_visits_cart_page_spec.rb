require 'rails_helper'

RSpec.feature "Cart" do
  scenario "user visits the cart page" do
    item = create(:item, title: "Bespoke Beard Oil Brush")

    visit items_path
    within(".item_#{item.id}") do
      click_button "Add to Cart"
    end

    click_on "Cart (1)"
    expect(page).to have_current_path("/cart")
    expect(page).to have_content("#{item.title}")
    expect(page).to have_content("#{item.description}")
    expect(page).to have_content("#{item.price}")
  end
end
