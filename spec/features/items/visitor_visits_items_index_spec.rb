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

  scenario 'visitor clicks on an item and sees individual item page' do
    item1 = create(:item)

    visit items_path
    expect(page).to have_content(item1.title)
    click_on(item1.title)
    expect(page).to have_current_path(category_item_path(item1.category, item1))
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
    expect(page).to have_content("Buy Now!")
  end

  scenario 'visitor clicks on an item and then clicks on category and sees category page' do
    item1 = create(:item)

    visit items_path
    expect(page).to have_content(item1.title)
    click_on(item1.title)
    expect(page).to have_current_path(category_item_path(item1.category, item1))
    click_on(item1.category.title)
    expect(page).to have_current_path(category_path(item1.category))
    expect(page).to have_content("#{item1.category.title} category")
    expect(page).to have_title("Little Shop | #{item1.category.title}")
  end

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
    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
    click_on(category1.title)
    expect(page).to have_current_path(category_path(category1))
    expect(page).to have_content("#{category1.title} category")
  end
end
