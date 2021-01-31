require 'rails_helper'
describe "delivery" do
  describe "#create" do
    it "register new?" do
      delivery = build(:delivery)
      expect(delivery).to be_valid
    end
  end
end