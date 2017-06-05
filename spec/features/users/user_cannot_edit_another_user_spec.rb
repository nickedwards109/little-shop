require 'rails_helper'

RSpec.feature 'User', type: :feature do
  let(:user1) {create(:user)}
  let(:user2) {create(:user)}

  scenario 'tries to edit another user' do
    visit(login_path)
    fill_in 'user[username]', with: user1.username
    fill_in 'user[password]', with: user1.password
    click_on('Submit Login')

    visit edit_user_path(user2)
    expect(page).to have_current_path(root_path)
  end
end
