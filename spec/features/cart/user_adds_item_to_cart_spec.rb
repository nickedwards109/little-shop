require 'rails_helper'

feature "Cart" do
  scenario "visitor adds an item to their cart" do
    item = create(:item)

    visit items_path
    within(".item_#{item.id}") do
      click_button "Add to Cart"
    end
    expect(page).to have_content("You have added 1 #{item.title} to your cart.")
  end
end
