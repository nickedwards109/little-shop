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

  describe 'methods' do
    it '#contained_items' do
      order = create(:order)
      item1 = create(:item)
      item2 = create(:item)

      OrderItem.create(order: order, item: item1)
      OrderItem.create(order: order, item: item2)

      expect(order.contained_items).to eq(item1 => 1, item2 => 1)
    end

    it '#total_price' do
      order = create(:order)
      item1 = create(:item)
      item2 = create(:item)

      OrderItem.create(order: order, item: item1)
      OrderItem.create(order: order, item: item2)

      items_total = (item1.price + item2.price)

      expect(order.total_price).to eq(items_total)
    end
  end
end
