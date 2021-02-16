class CardsController < ApplicationController
  require "date"
  require 'payjp'

  def new
    @card = Card.new
    # @card = Card.where(user_id: current_user.id).first
    # redirect_to root_path, if card.present?
  
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
      redirect_to action: "new"
    end
   end
  end
end
