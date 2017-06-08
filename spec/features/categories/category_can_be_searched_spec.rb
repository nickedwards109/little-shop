require 'rails_helper'

RSpec.feature 'Categories', :type => :feature do
  scenario 'can be found by search function' do
    create_list(:category, 20)
    category = create(:category, title: 'Cars, Trucks, and Planes')

    visit items_path
    within("#search-categories") do
      fill_in("search", with: category.title)
      click_on("Search")
    end

    expect(page).to have_content(category.title)
  end
end
