require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end

  describe "relationships" do
    let(:category) {create(:category)}

    it "has many items" do
      expect(category).to respond_to(:items)
    end
  end
end
