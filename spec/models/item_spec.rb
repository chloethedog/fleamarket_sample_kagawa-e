require 'rails_helper'

describe Item do
  describe '#create' do
    context '正常に保存' do
      it "is invalid without a name" do
        item = build(:item, name: nil)
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