class Api::CommentsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    last_comment_id = params[:id]
    @comments = @item.comments.includes(:user).where("id > ?", last_comment_id)
  end
end