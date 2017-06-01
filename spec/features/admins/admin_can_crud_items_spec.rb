require 'rails_helper'

RSpec.feature "Admin", type: :feature do
  scenario "can view items" do
    admin = create(:user, role: "admin")
    create_list(:item, 5)

    visit(login_path)
    fill_in "user[username]", with: admin.username
    fill_in "user[password]", with: admin.password
    click_on('Submit Login')

    expect(page).to have_current_path('/admin/dashboard')
    click_on('View All Items')
    
    expect(page).to have_current_path(admin_items_path)
    save_and_open_page
  end
end
