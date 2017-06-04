require 'rails_helper'

RSpec.feature "Admin", type: :feature do
  let(:admin) {create(:user, role: 'admin')}

  before(:each) do
    visit(login_path)
    fill_in "user[username]", with: admin.username
    fill_in "user[password]", with: admin.password
    click_on('Submit Login')
  end

  scenario "can view all orders" do
    expect(page).to have_current_path('/admin/dashboard')
  end
end
