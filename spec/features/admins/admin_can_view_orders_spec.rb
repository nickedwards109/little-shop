require 'rails_helper'

RSpec.feature "Admin", type: :feature do
  let(:admin) {create(:user, role: 'admin')}
  let(:order) {create(:order)}

  before(:each) do
    visit(login_path)
    fill_in "user[username]", with: admin.username
    fill_in "user[password]", with: admin.password
    click_on('Submit Login')
  end

  scenario "can view all orders" do
    skip
    # click_on("order number: #{order.id}")
    find(:xpath, "//a[@href='/admin/orders/#{order.id}']").click
    expect(page).to have_content(order.user.name)
    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.user.address.street_address)
    expect(page).to have_content(order.status)
  end
end
