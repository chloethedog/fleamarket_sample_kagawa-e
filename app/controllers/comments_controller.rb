class CommentsController < ApplicationController
  def index
  end

  def create
    @comment = @item.comments.new(comment_params)
    if @comment.save
      redirect_to item_path(@item), notice: 'コメントが送信されました'
    else
      @comment =  @item.comments.includes(:item)
      flash.now[:alert] = 'メッセージを入力してください。'
      render item_path(@item)
    end
  end
end
