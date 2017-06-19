require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "cannot visit the login page once already authenticated" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit login_path
    expect(page).to have_current_path(root_path)
  end
end
