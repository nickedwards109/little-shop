require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "can edit own account" do
    user = create(:user)
    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')

    expect(page).to have_current_path(dashboard_path)
    click_on("Edit Account")
    fill_in "user[username]", with: 'gooduser'
    fill_in "user[password]", with: 'new_password'
    click_on('Update User')

    updated_user = User.find(user.id)
    expect(updated_user.username).to eq('gooduser')
  end
end
