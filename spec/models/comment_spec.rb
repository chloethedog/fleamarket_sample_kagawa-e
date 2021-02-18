require 'rails_helper'

describe User do
  describe "#create" do
    before :each do
      @comment = build(:comment)
    end
    context "post normally" do
      it "post new?" do
        expect(@comment).to be_valid
      end
      it "text of 250 characters or less is valid" do
        @comment.text = "a" * 250
        expect(@comment).to be_valid
      end
    end
    context "post failure" do
      it "is invalid without a text" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors[:text]).to include("を入力してください")
      end

      it "is invalid without user_id" do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors[:user]).to include("を入力してください")
      end

      it "is invalid without item_id" do
        @comment.item_id = nil
        @comment.valid?
        expect(@comment.errors[:item]).to include("を入力してください")
      end

      it "text of 250 characters or more is invalid" do
        @comment.text = "a" * 251
        @comment.valid?
        expect(@comment.errors[:text]).to include("は250文字以下で入力してください")
      end
    end
  end
end