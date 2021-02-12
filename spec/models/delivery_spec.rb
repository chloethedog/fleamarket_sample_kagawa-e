require 'rails_helper'
describe Delivery do
  describe "#create" do
    before :each do
      @delivery = build(:delivery)
    end
    context "save normally" do

      it "register new?" do
        expect(@delivery).to be_valid
      end

      it "valid without address_detail" do
        @delivery.address_detail = ""
        expect(@delivery).to be_valid
      end
  
      it "valid without phone number" do
        @delivery.phone_number = ""
        expect(@delivery).to be_valid
      end
  
      it "is invalid without user_id" do
        @delivery.user_id = ""
        expect(@delivery).to be_valid
      end
    end
    context "save failure" do
      it "is invalid without postal_code" do
        @delivery.postal_code =  ""
        @delivery.valid?
        expect(@delivery.errors[:postal_code]).to include("は空で入力しないでください。")
      end
  
      it "is invalid without prefecture_id" do
        @delivery.prefectures_id = ""
        @delivery.valid?
        expect(@delivery.errors[:prefectures_id]).to include("は空で入力しないでください。")
      end
  
      it "is invalid without municipality" do
        @delivery.municipality = ""
        @delivery.valid?
        expect(@delivery.errors[:municipality]).to include("は空で入力しないでください。")
      end
  
      it "is invalid without address" do
        @delivery.address = ""
        @delivery.valid?
        expect(@delivery.errors[:address]).to include("は空で入力しないでください。")
      end
    end
  end
end