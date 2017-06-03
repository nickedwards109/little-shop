require 'rails_helper'

RSpec.feature "User", type: :feature do
  let(:user) {create(:user)}

  before(:each) do
    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')
  end


  scenario "can view own orders" do
    create_list(:order, 5, user_id: user.id)
    oldest_order = Order.first
    newest_order = Order.last

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content(oldest_order.id.to_s)
    expect(page).to have_content(oldest_order.status)
    expect(page).to have_content(oldest_order.created_at)
    expect(page).to have_content(newest_order.id.to_s)
    expect(page).to have_content(newest_order.status)
    expect(page).to have_content(newest_order.created_at)
  end

  scenario "can view all past orders" do
    create_list(:order, 20, user_id: user.id)
    oldest_order = Order.first
    newest_order = Order.last

    expect(page).to have_current_path(orders_path)
    expect(page).to have_content(oldest_order.id.to_s)
    expect(page).to have_content(oldest_order.status)
    expect(page).to have_content(oldest_order.created_at)
    expect(page).to have_content(newest_order.id.to_s)
    expect(page).to have_content(newest_order.status)
    expect(page).to have_content(newest_order.created_at)
  end
end
