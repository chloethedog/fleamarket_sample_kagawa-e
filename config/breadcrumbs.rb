# フリマ > マイページ
crumb :root do
  link "フリマ", root_path
end

crumb :user do
  link "マイページ", user_path
  parent :root
end

crumb :item do
  link Item.find_by(params[:id]).name, item_path
  parent :root
end