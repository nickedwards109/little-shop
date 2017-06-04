require 'rails_helper'

RSpec.feature 'Admin', type: :feature do
  let(:admin) {create(:user, role: 'admin')}

  before(:each) do
    create_list(:item, 5)
    @item1 = Item.first
    @item2 = Item.last

    visit(login_path)
    fill_in 'user[username]', with: admin.username
    fill_in 'user[password]', with: admin.password
    click_on('Submit Login')
  end

  scenario 'can view items' do
    expect(page).to have_current_path('/admin/dashboard')
    click_on('View All Items')

    expect(page).to have_current_path(admin_items_path)
    expect(page).to have_content(@item1.title)
    expect(page).to have_content(@item2.title)
  end

  scenario 'can edit item' do
    category = create(:category)
    visit admin_items_path

    within ".item_#{@item1.id}" do
      click_on 'Edit Item'
    end

    fill_in 'item[title]', with: 'Beanie Baby'
    fill_in 'item[description]', with: 'A toy for grown men to sleep with'
    fill_in 'item[price]', with: 21.99
    select category.title, :from => 'item[category_id]'
    select 'out-of-stock', :from => 'item[inventory_status]'
    click_on('Update Item')

    item = Item.find(@item1.id)
    expect(item.title).to eq('Beanie Baby')
    expect(item.description).to eq('A toy for grown men to sleep with')
    expect(item.price).to eq(21.99)
    expect(item.category).to eq(category)
  end

  scenario 'can create a new item' do
    category = create(:category)

    visit admin_dashboard_path
    click_on('Add a New Item')

    fill_in 'item[title]', with: 'toy water'
    fill_in 'item[description]', with: 'water for children'
    fill_in 'item[price]', with: 21.99
    select category.title, :from => 'item[category_id]'
    select 'out-of-stock', :from => 'item[inventory_status]'
    attach_file("item[image]", "./public/assets/sample.jpg")
    click_on('Create Item')

    item = Item.find_by(title: 'toy water')

    expect(page).to have_current_path(admin_items_path)
    expect(page).to have_content(item.title)
    expect(item).not_to be(nil)
  end
end
