require 'rails_helper'

RSpec.feature "User", type: :feature do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    create_list(:item, 5)
  end

  scenario "can't see edit path" do
    visit items_path

    expect(page).not_to have_content('Edit Item')
  end

  scenario "gets 404 when trying to edit item" do
    item = Item.first
    visit edit_admin_item_path(item)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

end
