require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "cannot access admin dashboard" do
    user = create(:user)

    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')
    visit(admin_dashboard_path)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end