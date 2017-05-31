require 'rails_helper'

RSpec.describe User, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }

    it { should validate_uniqueness_of(:username) }
  end

  describe "relationships" do
    before(:each) do
      @user = create(:user)
    end

    it "has many orders" do
      expect(@user).to respond_to(:orders)
    end
  end
end
