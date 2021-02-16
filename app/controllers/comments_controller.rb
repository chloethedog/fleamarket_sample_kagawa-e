class CommentsController < ApplicationController
  before_action :set_item
  

  def create
    @comment = @item.comments.new(comment_params)
    if @comment.save
      redirect_to item_path(@item), notice: 'コメントが送信されました'
    else
      @comments =  @item.comments.includes(:item)
      flash.now[:alert] = 'メッセージを入力してください。'
      render item_path(@item)
    end
  end

  def new
    return @comment
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :item_id).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
end
