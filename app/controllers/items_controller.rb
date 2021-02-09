class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.build_item_photo
    @category = Category.roots
  end

  def get_category
    selected_category=Category.find(params[:category_id])
    @category = selected_category.children
 end

end
