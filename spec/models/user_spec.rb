require 'rails_helper'
describe "user" do
  describe "#create" do
    it "register new?" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email address" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      user = build(:user)
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with Email addresses without @ and domain" do
      user = build(:user, email: "test")
      user.valid?
      expect(user.errors[:email]).to include("は＠とドメインを含む必要があります")
    end

    it "is invalid with Email addresses without @ " do
      user = build(:user, email: "test.tet")
      user.valid?
      expect(user.errors[:email]).to include("は＠とドメインを含む必要があります")
    end
    
    it "is invalid with Email addresses without domain " do
      user = build(:user, email: "test@test")
      user.valid?
      expect(user.errors[:email]).to include("は＠とドメインを含む必要があります")
    end
  end

end