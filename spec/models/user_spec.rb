require 'rails_helper'
describe "@user" do
  describe "#create" do
    before :each do
      @user= build(:user)
    end
    context "save normally" do
      it "register new?" do
        expect(@user).to be_valid
      end

      it "is valid without profile" do
        @user.profile = ""
        expect(@user).to be_valid
      end

      it "password of 7 characters or more is valid" do
        @user.password = "test0000"
        @user.password_confirmation = "test0000"
        expect(@user).to be_valid
      end

      it "password of 7 characters is valid" do
        @user.password = "test000"
        @user.password_confirmation = "test000"
        expect(@user).to be_valid
      end

    end
    context "save failure" do
      it "is invalid without a nickname" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include("は空で入力しないでください。")
      end
  
      it "is invalid without a email address" do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("は空で入力しないでください。")
      end
  
      it "is invalid with a duplicate email address" do
        @user = create(:user)
        @user = build(:user)
        @user.valid?
        expect(@user.errors[:email]).to include("はすでに存在します")
      end
  
      it "is invalid with Email addresses without @ and domain" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors[:email]).to include("は不正な値です")
      end
  
      it "is invalid with Email addresses without @ " do
        @user.email = "test.tet"
        @user.valid?
        expect(@user.errors[:email]).to include("は不正な値です")
      end
  
      it "is invalid without a password" do
        @user.password = ""
        @user.valid?
        expect(@user.errors[:password]).to include("は空で入力しないでください。")
      end
  
      it "is invalid without a password_confirmation" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
  
      it "is invalid without entry the same password" do
        @user.password_confirmation = "test0001"
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
      
      it "passwords of 6 characters or less is invalid" do
        @user.password = "test00"
        @user.password_confirmation = "test00"
        @user.valid?
        expect(@user.errors[:password]).to include("は7文字以上で入力してください")
      end
  
      it "passwords of 128 characters or less is invalid" do
        @user.password = "test000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
        @user.password_confirmation = "test000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
        @user.valid?
        expect(@user.errors[:password]).to include("は128文字以内で入力してください")
      end
  
      it "is invalid without last name" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors[:last_name]).to include("は空で入力しないでください。")
      end
  
      it "is invalid without first name" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors[:first_name]).to include("は空で入力しないでください。")
      end
  
      it "is invalid without full-width last name" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors[:last_name]).to include("に全角文字を使用してください")
      end
  
      it "is invalid without full-width first name" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors[:first_name]).to include("に全角文字を使用してください")
      end
  
      it "is invalid without last name ruby" do
        @user.last_name_ruby = ""
        @user.valid?
        expect(@user.errors[:last_name_ruby]).to include("は空で入力しないでください。")
      end
  
      it "is invalid without first name ruby" do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors[:first_name_ruby]).to include("は空で入力しないでください。")
      end
  
      it "last name ruby is invalid in kanji" do
        @user.last_name_ruby = "試験"
        @user.valid?
        expect(@user.errors[:last_name_ruby]).to include("に全角ひらがなを使用してください")
      end
  
      it "first name ruby is invalid in kanji" do
        @user.first_name_ruby = "試験"
        @user.valid?
        expect(@user.errors[:first_name_ruby]).to include("に全角ひらがなを使用してください")
      end
  
      it "last name ruby is invalid in katakana" do
        @user.last_name_ruby = "テスト"
        @user.valid?
        expect(@user.errors[:last_name_ruby]).to include("に全角ひらがなを使用してください")
      end
  
      it "first name ruby is invalid in katakana" do
        @user.first_name_ruby = "テスト"
        @user.valid?
        expect(@user.errors[:first_name_ruby]).to include("に全角ひらがなを使用してください")
      end
  
      it "last name ruby is invalid in ABC" do
        @user.last_name_ruby = "test"
        @user.valid?
        expect(@user.errors[:last_name_ruby]).to include("に全角ひらがなを使用してください")
      end
  
      it "first name ruby is invalid in ABC" do
        @user.first_name_ruby = "test"
        @user.valid?
        expect(@user.errors[:first_name_ruby]).to include("に全角ひらがなを使用してください")
      end
  
      it "is invalid without a birthday" do
        @user.birthday = "test"
        @user.valid?
        expect(@user.errors[:birthday]).to include("は空で入力しないでください。")
      end
    end
  end

end