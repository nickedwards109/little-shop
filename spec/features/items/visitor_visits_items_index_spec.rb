require 'rails_helper'

RSpec.feature 'Items Index' do
  scenario 'visitor visits the items index page' do
    item_1 = create(:item)
    item_2 = create(:item)
    # Our factories will have to create unique items with a sequence

    visit items_path
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    # For now, the image is untested.
    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
  end
end
