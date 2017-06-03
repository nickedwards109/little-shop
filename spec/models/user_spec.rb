require 'rails_helper'

RSpec.describe User, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }
    it { should validate_uniqueness_of(:username) }
    it { should have_secure_password }
    it { should define_enum_for(:role) }
  end

  describe "relationships" do
    let(:user) {create(:user)}

    it "has many orders" do
      expect(user).to respond_to(:orders)
    end

    it "has many address" do
      expect(user).to respond_to(:addresses)
    end
  end
end
