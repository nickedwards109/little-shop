require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "relationships" do
    let(:order_item) {create(:order_item)}

    it "belongs to order" do
      expect(order_item).to respond_to(:order)
    end

    it "belongs to item" do
      expect(order_item).to respond_to(:item)
    end
  end
end
