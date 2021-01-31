require 'rails_helper'
describe "delivery" do
  describe "#create" do
    it "register new?" do
      delivery = build(:delivery)
      expect(delivery).to be_valid
    end

    it "is invalid without postal_code" do
      delivery = build(:delivery, postal_code: "")
      delivery.valid?
      expect(delivery.errors[:postal_code]).to include("can't be blank")
    end

    it "is invalid without prefecture_id" do
      delivery = build(:delivery, prefectures_id: "")
      delivery.valid?
      expect(delivery.errors[:prefectures_id]).to include("can't be blank")
    end

    it "is invalid without municipality" do
      delivery = build(:delivery, municipality: "")
      delivery.valid?
      expect(delivery.errors[:municipality]).to include("can't be blank")
    end

    it "is invalid without address" do
      delivery = build(:delivery, address: "")
      delivery.valid?
      expect(delivery.errors[:address]).to include("can't be blank")
    end

    it "valid without address_detail" do
      delivery = build(:delivery, address_detail: "")
      expect(delivery).to be_valid
    end

    it "valid without phone number" do
      delivery = build(:delivery, phone_number: "")
      expect(delivery).to be_valid
    end

  end
end