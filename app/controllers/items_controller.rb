class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.build_item_photo
    @category = Category.roots
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      @category = Category.roots
      render "new"
    end
  end

  def get_category
    selected_category=Category.find(params[:category_id])
    @category = selected_category.children
  end


 private
  def item_params
    params.require(:item).permit(:name, :seller_id, :price, :purchase, :buyer_id, :explanation, :category_id, :state_id, :brand, :delivery_fee_id, :delivery_area_id, :delivery_method_id, :shipment_date_id, item_photo_attributes: [:thumbnail])
  end

end
