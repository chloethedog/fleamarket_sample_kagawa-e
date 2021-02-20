require 'rails_helper'

describe Favorite do
  describe "#create" do
    before :each do
      @favorite = build(:favorite)
    end
    context "save normally" do
      it "post new?" do
        expect(@favorite).to be_valid
      end
    end
    context "save failure" do
      it "is invalid without user_id" do
        @favorite.user_id = nil
        @favorite.valid?
        expect(@favorite.errors[:user]).to include("を入力してください")
      end
      it "is invalid without item_id" do
        @favorite.item_id = nil
        @favorite.valid?
        expect(@favorite.errors[:item]).to include("を入力してください")
      end
    end
  end
end