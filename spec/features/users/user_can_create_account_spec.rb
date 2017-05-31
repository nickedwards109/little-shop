require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "can create a new account" do
    visit(new_user_path)
    
    fill_in "user[name]", with: "Bob Saget"
    fill_in "user[username]", with: "BSG"
    fill_in "user[password]", with: "password"
    click_on "Create Account"

    user = User.first
    
    expect(page).to have_current_path(login_path)
    expect(page).to have_content("Account Creation Successful!")
    expect(user.name).to eq("Bob Saget")
    expect(user.username). to eq("bsg")
  end
end
