require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "can login" do
    user = create(:user)

    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')

    expect(page).to have_current_path('/dashboard')
    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).not_to have_content("Login")
    expect(page).to have_content("Logout")
  end
end
