require 'rails_helper'

RSpec.feature "Cart" do
    scenario "user removes an item from the cart page" do
      item = create(:item, title: "Bespoke Beard Oil Brush")

      visit items_path
      within(".item_#{item.id}") do
        click_button "Add to Cart"
      end

      click_on "Cart (1)"
      click_on "Remove"
      expect(page).to have_current_path(cart_path)
      expect(page).to have_content("Successfully removed #{item.title} from your cart.")
      expect(page).to have_content("Cart (0)")
      click_on(item.title)
      expect(page).to have_current_path(item_path(item))
    end

    scenario "user increases the quantity of an item in the cart" do
      item = create(:item, title: "Bespoke Beard Oil Brush")

      visit items_path
      within(".item_#{item.id}") do
        click_button "Add to Cart"
      end

      click_on "Cart (1)"
      expect(page).to have_content("Quantity: 1")
      click_button "Increase quantity"
      expect(page).to have_content("Cart (2)")
      expect(page).to have_content("Quantity: 2")
    end

    scenario "user decreases the quantity of an item in the cart" do
      item = create(:item, title: "Bespoke Beard Oil Brush")

      visit items_path

      within(".item_#{item.id}") do
        click_button "Add to Cart"
      end
      within(".item_#{item.id}") do
        click_button "Add to Cart"
      end

      click_on "Cart (2)"
      expect(page).to have_content("Quantity: 2")
      click_button("Reduce quantity")
      expect(page).to have_content("Cart (1)")
      expect(page).to have_content("Quantity: 1")
    end
end
