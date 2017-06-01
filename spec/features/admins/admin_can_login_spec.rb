require 'rails_helper'

RSpec.feature "Admin", type: :feature do
  scenario "can login" do
    admin = create(:user, role: "admin")

    visit(login_path)
    fill_in "user[username]", with: admin.username
    fill_in "user[password]", with: admin.password
    click_on('Submit Login')

    expect(page).to have_current_path('/admin/dashboard')
    expect(page).to have_content("Logged in as #{admin.username}")
    expect(page).not_to have_content("Login")
    expect(page).to have_content("Logout")
  end
end
