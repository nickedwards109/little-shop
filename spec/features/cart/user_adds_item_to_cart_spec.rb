require 'rails_helper'

feature "Cart" do
  scenario "visitor adds an item to their cart" do
    item = create(:item, title: "Bespoke Beard Oil Brush")

    visit items_path
    within(".item_#{item.id}") do
      click_button "Add to Cart"
    end
    within(".item_#{item.id}") do
      click_button "Add to Cart"
    end
    expect(page).to have_content("Your cart now contains 2 Bespoke Beard Oil Brushes.")
    expect(page).to have_current_path(items_path)
  end
end
