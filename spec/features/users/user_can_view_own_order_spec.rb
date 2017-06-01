require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "can view own orders" do
    user = create(:user)
    create_list(:order, 5, user_id: user.id)
    oldest_order = Order.first
    newest_order = Order.last

    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content(oldest_order.id.to_s)
    expect(page).to have_content(oldest_order.status)
    expect(page).to have_content(oldest_order.created_at)
    expect(page).to have_content(newest_order.id.to_s)
    expect(page).to have_content(newest_order.status)
    expect(page).to have_content(newest_order.created_at)
  end
end
