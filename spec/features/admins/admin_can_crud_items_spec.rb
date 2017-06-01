require 'rails_helper'

RSpec.feature "Admin", type: :feature do
  before(:each) do
    admin = create(:user, role: "admin")
    create_list(:item, 5)
    @item1 = Item.first
    @item2 = Item.last

    visit(login_path)
    fill_in "user[username]", with: admin.username
    fill_in "user[password]", with: admin.password
    click_on('Submit Login')
  end

  scenario "can view items" do
    expect(page).to have_current_path('/admin/dashboard')
    click_on('View All Items')
    
    expect(page).to have_current_path(admin_items_path)
    expect(page).to have_content(@item1.title)
    expect(page).to have_content(@item2.title)
  end

  scenario "can edit item" do
    visit admin_items_path

    within ".item_#{@item1.id}" do
      click_on "Edit Item"
    end

    fill_in 'item[title]', with: 'Beanie Baby'
    fill_in 'item[description]', with: 'A toy for grown men to sleep with'
    fill_in 'item[price]', with: 21.99
    # click_on('Update Item')
  end
end
