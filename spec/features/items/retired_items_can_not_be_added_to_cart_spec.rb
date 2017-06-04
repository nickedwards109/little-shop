require 'rails_helper'

RSpec.feature 'Items', :type => :feature do
  scenario 'are retired and cannot be added to cart' do
    item = create(:item, inventory_status: 'retired')

    visit items_path
    save_and_open_page
    within ("item_#{item.id}") do
      expect(page).not_to have_content('Add to Cart')
      expect(page).to have_content('Item Retired')
    end
  end
end
