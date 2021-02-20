class FavoritesController < ApplicationController
  before_action :set_item
  before_action :search

  def create
    if @favorite
      redirect_to item_path(@item)
    else
      @favorites = @item.favorites.create(favorite_params)
      redirect_to item_path(@item)
    end
  end

  def destroy
    if @favorite
      @favorite.destroy
      redirect_to item_path(@item)
    else
      redirect_to item_path(@item)
    end
  end


  private

  def search
    @favorite = Favorite.find_by(item_id: @item.id, user_id: current_user.id)
  end

  def favorite_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
end
