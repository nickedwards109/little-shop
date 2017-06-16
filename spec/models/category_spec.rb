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

  describe "methods" do
    it "can search for category with a case insensitive partial" do
      category = create(:category, title: "Boys and Girls Clothing")
      result = Category.search("IrLs")

      expect(result[0]).to eq(category)
    end
  end
end
