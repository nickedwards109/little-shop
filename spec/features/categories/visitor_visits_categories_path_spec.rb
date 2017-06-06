require 'rails_helper'

RSpec.feature 'Categories Index' do
  scenario 'visitor visits the categories page and sees all categories' do
    category1 = create(:category)
    category2 = create(:category)

    visit categories_path
    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
  end

  scenario 'visitor visits the categories page and clicks on a category and sees category show page' do
    category1 = create(:category)
    category2 = create(:category)

    visit categories_path
    within(".main-view") do
      click_on(category1.title)
    end

    expect(page).to have_current_path(category_path(category1))
    expect(page).to have_content("#{category1.title} category")
  end
end
