require 'rails_helper'

RSpec.feature 'Items Index' do
  scenario 'visitor visits the items index page' do
    item1 = create(:item)
    item2 = create(:item)

    visit items_path

    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
    expect(page).to have_content(item2.title)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.price)
  end

  scenario 'visitor clicks on an item and sees individual item page' do
    item1 = create(:item)

    visit items_path
    click_on(item1.title)

    expect(page).to have_current_path(category_item_path(item1.category, item1))
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
  end

  scenario 'visitor clicks on an item and then clicks on category and sees category page' do
    item1 = create(:item)

    visit(category_item_path(item1.category, item1))
    within(".main-view") do
      click_on(item1.category.title)
    end

    expect(page).to have_current_path(category_path(item1.category))
    expect(page).to have_content("#{item1.category.title} category")
    expect(page).to have_title("Little Shop | #{item1.category.title}")
  end
end
