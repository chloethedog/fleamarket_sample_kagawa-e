json.array! @comments do |comment|
  json.text comment.text
  json.user_id comment.user_id
  json.user_name comment.user.nickname
  json.created_at comment.created_at
  json.id comment.id 
  json.seller_id @item.seller_id
end