class CommentsController < ApplicationController
  before_action :set_item
  

  def create
    @comment = @item.comments.create(comment_params)
    respond_to do |format|
      format.html {redirect_to item_path(@item)}
      format.json
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text, :item_id).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
end
