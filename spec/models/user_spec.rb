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
      expect(user.errors[:nickname]).to include("は空で入力しないでください。")
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

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("は空で入力しないでください。")
    end

    it "is invalid without entry the same password" do
      user = build(:user, password: "test0000", password_confirmation: "test0001")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "password of 7 characters or more is valid" do
      user = build(:user, password: "test000", password_confirmation: "test000")
      expect(user).to be_valid
    end
    
    it "passwords of 6 characters or less is invalid" do
      user = build(:user, password: "test00", password_confirmation: "test00")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "is invalid without last name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("は空で入力しないでください。")
    end

    it "is invalid without first name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("は空で入力しないでください。")
    end

    it "is invalid without full-width last name" do
      user = build(:user, last_name: "test")
      user.valid?
      expect(user.errors[:last_name]).to include("に全角文字を使用してください")
    end

    it "is invalid without full-width first name" do
      user = build(:user, first_name: "test")
      user.valid?
      expect(user.errors[:first_name]).to include("に全角文字を使用してください")
    end

    it "is invalid without last name ruby" do
      user = build(:user, last_name_ruby: "")
      user.valid?
      expect(user.errors[:last_name_ruby]).to include("は空で入力しないでください。")
    end

    it "is invalid without first name ruby" do
      user = build(:user, first_name_ruby: "")
      user.valid?
      expect(user.errors[:first_name_ruby]).to include("は空で入力しないでください。")
    end

    it "last name ruby is invalid in kanji" do
      user = build(:user, last_name_ruby: "試験")
      user.valid?
      expect(user.errors[:last_name_ruby]).to include("に全角ひらがなを使用してください")
    end

    it "first name ruby is invalid in kanji" do
      user = build(:user, first_name_ruby: "試験")
      user.valid?
      expect(user.errors[:first_name_ruby]).to include("に全角ひらがなを使用してください")
    end

    it "last name ruby is invalid in katakana" do
      user = build(:user, last_name_ruby: "テスト")
      user.valid?
      expect(user.errors[:last_name_ruby]).to include("に全角ひらがなを使用してください")
    end

    it "first name ruby is invalid in katakana" do
      user = build(:user, first_name_ruby: "テスト")
      user.valid?
      expect(user.errors[:first_name_ruby]).to include("に全角ひらがなを使用してください")
    end

    it "last name ruby is invalid in ABC" do
      user = build(:user, last_name_ruby: "test")
      user.valid?
      expect(user.errors[:last_name_ruby]).to include("に全角ひらがなを使用してください")
    end

    it "first name ruby is invalid in ABC" do
      user = build(:user, first_name_ruby: "test")
      user.valid?
      expect(user.errors[:first_name_ruby]).to include("に全角ひらがなを使用してください")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: "test")
      user.valid?
      expect(user.errors[:birthday]).to include("は空で入力しないでください。")
    end


  end

end