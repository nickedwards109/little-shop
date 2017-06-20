require 'rails_helper'

RSpec.feature 'User', type: :feature do
  let(:user) {create(:user)}

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    create_list(:order, 10, user_id: user.id)
  end

  scenario 'can view last five orders' do
    visit dashboard_path
    newest_order = Order.last
    fifth_order_id = newest_order.id - 4
    fifth_newest_order = Order.find(fifth_order_id)

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content(fifth_newest_order.id.to_s)
    expect(page).to have_content(fifth_newest_order.status)
    expect(page).to have_content(fifth_newest_order.created_at)
    expect(page).to have_content(newest_order.id.to_s)
    expect(page).to have_content(newest_order.status)
    expect(page).to have_content(newest_order.created_at)
  end

  scenario 'can view all past orders' do
    oldest_order = Order.first
    newest_order = Order.last
    visit dashboard_path
    click_on('View All Past Orders')

    expect(page).to have_current_path(orders_path)
    expect(page).to have_content(oldest_order.id.to_s)
    expect(page).to have_content(oldest_order.status)
    expect(page).to have_content(oldest_order.created_at)
    expect(page).to have_content(newest_order.id.to_s)
    expect(page).to have_content(newest_order.status)
    expect(page).to have_content(newest_order.created_at)
  end
end
