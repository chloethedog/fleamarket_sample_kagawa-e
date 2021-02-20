class FavoritesController < ApplicationController
  before_action :set_item

  def create
    if @favorite = Favorite.find_by(item_id: @item.id, user_id: current_user.id)
      if @favorite.destroy
        redirect_to item_path(@item)
      else
        flash.now[:alert] = 'お気に入りから削除できませんでした。'
        redirect_to item_path(@item)
      end
    else
      if @item.favorites.create(favorite_params)
        redirect_to item_path(@item)
      else
        flash.now[:alert] = 'お気に入りに登録できませんでした。'
        redirect_to item_path(@item)
      end
    end
  end


  private

  def favorite_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
end
