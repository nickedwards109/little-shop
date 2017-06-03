require 'rails_helper'

RSpec.feature "User", type: :feature do
  let(:user) {create(:user)}

  scenario "cannot visit the login page once already authenticated" do
    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')

    visit login_path
    expect(page).to have_current_path(root_path)
  end
end
