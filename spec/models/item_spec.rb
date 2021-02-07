require 'rails_helper'

describe Item do
  describe '#create' do
    context '正常に保存' do
      before do
        @user = FactoryBot.create(:user)  
        # 先にuserを作っておいて、インスタンス変数にいれる
      end
      it "is invalid without a name" do
        # user = FactoryBot.create(:user)
        item = FactoryBot.build(:item)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
    end
  end
end



# describe Item do
#   describe '#create' do
#     context '正常に保存' do
#       it "is invalid without a name" do
#         item = build(:item, name: nil)
#         item.valid?
#         expect(item.errors[:name]).to include("can't be blank")
#       end
#     end
#   end
# end