require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:stock_status) }
    
    it { should validate_uniqueness_of(:title) }
  end

  describe "relationships" do
    before(:each) do
      @item = create(:item)
    end

    it "belongs to category" do
      expect(@item).to respond_to(:category)
    end

    it "has many order items" do
      expect(@item).to respond_to(:order_items)
    end

    it "has many orders" do
      expect(@item).to respond_to(:orders)
    end
  end
end
