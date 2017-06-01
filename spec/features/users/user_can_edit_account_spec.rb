require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "can edit own account" do
    user = create(:user)

    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')

    expect(page).to have_current_path(dashboard_path)
    save_and_open_page
    click_on("Edit Account")
    
  end
end
