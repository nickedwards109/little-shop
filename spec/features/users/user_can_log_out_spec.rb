require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "can log out" do
    user = create(:user)

    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')

    expect(page).to have_content("Logout")
    expect(page).to have_content("Logged in as #{user.username}")

    click_on("Logout")
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Successfully Logged Out")
  end
end
