require 'rails_helper'

RSpec.describe "Cart" do
  scenario "unauthenticated visitor visits the cart" do
    visit cart_path
    expect(page).to have_content("Login or Register to Checkout")
  end

  scenario "visitor is logged in and now sees checkout button" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit cart_path
    expect(page).not_to have_content("Login or Register to Checkout")
    expect(page).to have_button("Checkout")
  end
end
