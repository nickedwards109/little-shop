require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:street_address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
  end

  describe "relationships" do
    it "belongs to user" do
      address = create(:address)
      expect(address).to respond_to(:user)
    end
  end
end
