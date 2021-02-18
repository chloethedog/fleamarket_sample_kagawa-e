json.text  @comment.text
json.user_id  @comment.user_id
json.user_name  @comment.user.nickname
json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.seller_id @item.seller_id
json.id @comment.id