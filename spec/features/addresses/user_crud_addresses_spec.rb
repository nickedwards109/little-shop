require 'rails_helper'

RSpec.feature 'Address', type: :feature do
  let(:user) {create(:user)}
  let(:address) {user.addresses.create(
    street_address: '123 Fake St', city: 'Denver', state: 'CO', zip_code: 80202)
  }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario 'can be created' do
    address = build_stubbed(:address,
                            street_address: '123 Blake St.',
                            street_address2: 'Unit 99',
                            city: 'Denver',
                            state: 'CO',
                            zip_code: 80202
    )

    visit(new_user_address_path(user))
    fill_in 'address[street_address]', with: address.street_address
    fill_in 'address[street_address2]', with: address.street_address2
    fill_in 'address[city]', with: address.city
    fill_in 'address[state]', with: address.state
    fill_in 'address[zip_code]', with: address.zip_code
    click_on 'Create Address'

    expect(page).to have_current_path(user_addresses_path(user))
    expect(page).to have_content('Successfully Created Address')
    expect(page).to have_content(address.street_address)
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