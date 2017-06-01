require 'rails_helper'

RSpec.feature "User", type: :feature do
  before(:each) do
    user = create(:user)
    create_list(:item, 5)
    @item1 = Item.first
    @item2 = Item.last

    visit(login_path)
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_on('Submit Login')
  end

  scenario "can't see edit path" do
    visit items_path

    expect(page).not_to have_content('Edit Item')
  end

  scenario "gets 404 when trying to edit item" do
    visit edit_admin_item_path(@item1)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

end
