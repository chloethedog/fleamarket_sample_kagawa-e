class CardsController < ApplicationController
    require "date"
    require 'payjp'

    def new
      @card = Card.new
      date = Date.today
      year = date.year
      after_year = year + 9
      @years = []
      year.upto(after_year) do |num|
        @years << num
      end
      @month = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    end

    def create
      Payjp.api_key = Rails.application.credentials[:payjp][:sk_test_key]
      if params['payjp-token'].blank?
        redirect_to action: "new"
      else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id, 
        card_id: customer.default_card
      )
      if @card.save
        redirect_to root_path, notice: 'カードを登録しました'
      else
        redirect_to action: "show"
      end
    end
    end


    def show 
      @card = Card.find_by(user_id: current_user.id)
      if @card.present?

        Payjp.api_key = Rails.application.credentials[:payjp][:sk_test_key]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @card_information = customer.cards.retrieve(@card.card_id)

      else 
        redirect_to action: "new", notice: 'カードを登録しましょう'
      end
    end
    

    def destroy
      card = Card.where(user_id: current_user.id).first
      if card.present?
        Payjp.api_key = Rails.application.credentials[:payjp][:sk_test_key]
        customer = Payjp::Customer.retrieve(card.customer_id)
        customer.delete
        card.delete
        redirect_to action: "new", notice: 'カードを登録削除しました'
      else

      redirect_to action: "show"
    end
  end
end