require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '正常に保存' do
      it "全ての値が入っているとき" do
        expect(@item).to be_valid
      end

      it "brand カラムが空のとき" do
        @item.brand =  nil
        expect(@item).to be_valid
      end
    end

    context '保存失敗' do
      it " name カラムが空のとき" do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("を入力してください")
      end

      it "price カラムが空のとき" do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("を入力してください")
      end

      it "purchase カラムが空のとき" do
        @item.purchase = nil
        @item.valid?
        expect(@item.errors[:purchase]).to include("を入力してください")
      end

      it "explanation カラムが空のとき" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors[:explanation]).to include("を入力してください")
      end

      it "state_id カラムが空のとき" do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors[:state_id]).to include("を入力してください")
      end

      it "delivery_fee_id カラムが空のとき" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors[:delivery_fee_id]).to include("を入力してください")
      end

      it "delivery_method_id カラムが空のとき" do
        @item.delivery_method_id = nil
        @item.valid?
        expect(@item.errors[:delivery_method_id]).to include("を入力してください")
      end

      it "shipment_date_id カラムが空のとき" do
        @item.shipment_date_id = nil
        @item.valid?
        expect(@item.errors[:shipment_date_id]).to include("を入力してください")
      end

      it "shipment_date_id カラムが空のとき" do
        @item.shipment_date_id = nil
        @item.valid?
        expect(@item.errors[:shipment_date_id]).to include("を入力してください")
      end

      it "item_photo が空のとき" do
        @item.item_photo = nil
        @item.valid?
        expect(@item.errors[:item_photo]).to include("を入力してください")
      end

    end
  end
end
