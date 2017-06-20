require 'rails_helper'

RSpec.feature 'User', type: :feature do
  let(:user) {create(:user)}

  before(:each) do
    visit(login_path)
    fill_in 'user[username]', with: user.username
    fill_in 'user[password]', with: user.password
    click_on('Submit Login')
  end

  scenario 'can edit own account' do
    click_on('Edit Account')
    fill_in 'user[username]', with: 'gooduser'
    fill_in 'user[password]', with: 'new_password'
    click_on('Update User')

    updated_user = User.find(user.id)
    expect(updated_user.username).to eq('gooduser')
    expect(page).to have_content('Account Successfully Updated')
  end

  scenario 'fails to update own account' do
    click_on('Edit Account')
    fill_in 'user[username]', with: ''
    click_on('Update User')

    expect(page).to have_content('Account Unable to Update')
  end
end
