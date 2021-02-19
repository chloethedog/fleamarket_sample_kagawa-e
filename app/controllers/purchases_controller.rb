class PurchasesController < ApplicationController

  def index

    @card = Card.find_by(user_id: current_user.id)
    if  @card.blank?
      redirect_to new_card_path, notice: '商品を購入するには、カードを登録してください。'
    
    else
    @user = current_user
    @item = Item.find(params[:item_id])
    @delivery = Delivery.where(user_id: current_user.id).first
    @prefecture = Prefecture.find(@delivery.prefectures_id)
    Payjp.api_key = Rails.application.credentials[:payjp][:sk_test_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay

    if @item = Item.find(params[:item_id])
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = Rails.application.credentials[:payjp][:sk_test_key]
      Payjp::Charge.create(
      :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )

      @item.update(purchase: 1, buyer_id: current_user.id)

      redirect_to root_path,  notice: '商品を購入しました'
    else
      @item = Item.find(params[:item_id])
      card = Card.where(user_id: current_user.id).first
      redirect_to item_purchases_path
    end
  end
end
