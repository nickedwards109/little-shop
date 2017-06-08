require 'rails_helper'

RSpec.feature 'Items', :type => :feature do
  scenario 'can be found by search function' do
    create_list(:item, 20)
    item = create(:item, title: 'MouSe wind And Fire')

    visit items_path
    within("#search-items") do
      fill_in("search", with: 'ouse')
      click_on("Search")
    end

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
  end
end
