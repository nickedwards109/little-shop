require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:status) }

    it { should define_enum_for(:status) }
  end

  describe "relationships" do
    let(:order) {create(:order)}

    it "belongs to user" do
      expect(order).to respond_to(:user)
    end

    it "has many order items" do
      expect(order).to respond_to(:order_items)
    end

    it "has many items" do
      expect(order).to respond_to(:items)
    end
  end
end
