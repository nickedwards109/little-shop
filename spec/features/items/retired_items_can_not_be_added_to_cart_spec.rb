require 'rails_helper'

RSpec.feature 'Items', :type => :feature do
  scenario 'are retired and cannot be added to cart' do
    create(:item, inventory_status: 'retired')
    visit items_path
    expect(page).not_to have_content('Add to Cart')
    expect(page).to have_content('Item Retired')
  end

  scenario 'are viewed individually and cannot be added to cart after being retired' do
    item = create(:item, inventory_status: 'retired')
    visit item_path(item)
    expect(page).not_to have_content('Add to Cart')
    expect(page).to have_content('Item Retired')
  end
end
