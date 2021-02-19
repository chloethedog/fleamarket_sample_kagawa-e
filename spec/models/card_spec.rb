require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#create' do
    before do
      @card = FactoryBot.build(:card)
    end
    context '正常に保存' do
      it "全ての値が入っているとき" do
        expect(@card).to be_valid
      end
    end

    context '保存失敗' do
      it " customer_id カラムが空のとき" do
        @card.customer_id = nil
        @card.valid?
        expect(@card.errors[:customer_id]).to include("を入力してください")
      end

      it " card_id カラムが空のとき" do
        @card.card_id = nil
        @card.valid?
        expect(@card.errors[:card_id]).to include("を入力してください")
      end
    end
  end
end
