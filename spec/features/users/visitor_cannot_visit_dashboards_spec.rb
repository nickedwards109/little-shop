require 'rails_helper'

RSpec.feature "Visitor", type: :feature do
  scenario "visitor cannot access admin dashboard" do
    visit(admin_dashboard_path)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario "visotr canot access user dashboard" do
    visit(dashboard_path)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end