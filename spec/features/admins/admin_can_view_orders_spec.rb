require 'rails_helper'

RSpec.feature 'Admin', type: :feature do
  let(:admin) {create(:user, role: 'admin')}

  before(:each) do
    visit(login_path)
    fill_in 'user[username]', with: admin.username
    fill_in 'user[password]', with: admin.password
    click_on('Submit Login')
  end

  scenario 'can view all orders' do
    user = create(:user)
    address = create(:address, user_id: user.id)
    order = create(:order, user_id: user.id)

    visit(admin_dashboard_path)
    find(:xpath, "//a[@href='/admin/orders/#{order.id}']").click
    
    expect(page).to have_content(order.user.name)
    expect(page).to have_content(order.created_at)
  end

  scenario 'can mark order as complete' do
    order2 = create(:order, status: 'paid')
    visit(admin_dashboard_path)
    click_on('Mark as Completed')

    order2 = Order.find(order2.id)
    expect(order2.status).to eq('completed')
  end

  scenario 'can mark order as paid' do
    order2 = create(:order, status: 'ordered')
    visit(admin_dashboard_path)
    click_on('Mark as Paid')

    order2 = Order.find(order2.id)
    expect(order2.status).to eq('paid')
  end

  scenario 'can mark order as cancelled' do
    order2 = create(:order, status: 'paid')
    visit(admin_dashboard_path)
    click_on('Cancel')

    order2 = Order.find(order2.id)
    expect(order2.status).to eq('cancelled')
  end

  scenario 'can filter view of orders' do
    create_list(:order, 5)
    order = create(:order, status: 'paid')

    visit(admin_dashboard_path)
    select('paid', :from => 'Order Status')
    click_on('Filter Orders')

    expect(page).to have_content('paid')
  end
end
