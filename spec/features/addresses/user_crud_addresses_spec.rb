require 'rails_helper'

RSpec.feature 'Address', type: :feature do
  let(:user) {create(:user)}
  let(:address) {user.addresses.create(
    street_address: '123 Fake St', city: 'Denver', state: 'CO', zip_code: 80202)
  }

  before(:each) do
    visit(login_path)
    fill_in 'user[username]', with: user.username
    fill_in 'user[password]', with: user.password
    click_on('Submit Login')
  end

  scenario 'can be created' do
    visit(new_user_address_path(user))
    fill_in 'address[street_address]', with: '123 Fake St'
    fill_in 'address[street_address2]', with: 'Apartment 4'
    fill_in 'address[city]', with: 'Denver'
    fill_in 'address[state]', with: 'Colorado'
    fill_in 'address[zip_code]', with: 80202
    click_on 'Create Address'

    expect(page).to have_current_path(user_addresses_path(user))
    expect(page).to have_content('Successfully Created Address')
    expect(page).to have_content('123 Fake St')
    expect(page).to have_content('Apartment 4')
    expect(page).to have_content('Denver')
    expect(page).to have_content('Colorado')
    expect(page).to have_content('80202')
  end

  scenario 'can be edited' do
    visit (edit_user_address_path(user, address))

    fill_in 'address[city]', with: 'Fort Collins'
    click_on 'Update Address'

    expect(page).to have_current_path(user_addresses_path(user))
    expect(page).to have_content('Fort Collins')
  end

  scenario 'can be deleted' do
    user.addresses.create(
      street_address: '123 Big St', city: 'Boulder', state: 'CO', zip_code: 80202
      )
    
    visit(user_addresses_path(user))
    within ('.edit_delete') do
      click_on ('Delete Address')
    end

    expect(page).to have_content('Successfully Deleted Address')
    expect(page).not_to have_content(address.street_address)
  end
end
