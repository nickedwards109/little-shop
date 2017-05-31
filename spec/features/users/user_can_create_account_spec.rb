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

  scenario "can get to login page from root and click to create account" do
    visit ('/')
    expect(page).to have_content("Login")

    click_on "Login"
    expect(page).to have_current_path(login_path)
    expect(page).to have_content("Create Account")

    click_on "Create Account"
    expect(page).to have_current_path(new_user_path)
  end
end
