require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "calculates the total number of items in the cart" do
    cart = Cart.new({"1" => 2, "2" => 3})
    expect(cart.total_count).to eq(5)
  end
end
