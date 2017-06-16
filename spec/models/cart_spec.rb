require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "methods include" do
    it "calculates the total number of items in cart" do
      contents = {"id1" => 2, "id2" => 3}
      cart = Cart.new(contents)
      expect(cart.total_count).to eq(5)
    end

    it "calculates dollar subtotal of items in cart" do
      item = create(:item, price: 1.99)
      contents = {item.id.to_s => 2}
      cart = Cart.new(contents)

      result = cart.dollar_subtotal(item)
      expect(result).to eq(3.98)
    end

    it "calculates total dollar amount of items in cart" do
      item = create(:item, price: 1.00)
      item2 = create(:item, price: 2.00)
      contents = {item.id.to_s => 1, item2.id.to_s => 1}
      cart = Cart.new(contents)

      result = cart.total_dollar_amount
      expect(result).to eq(3.00)
    end

    it "can change quantity of items in cart" do
      item = create(:item)
      contents = {item.id.to_s => 3}
      cart = Cart.new(contents)
      cart.change_quantity(item.id, 1)

      expect(cart.contents[item.id.to_s]).to eq(4)
    end
  end
end
