class ItemsController < ApplicationController
  before_action :item_edit, only: [:edit, :update]
  before_action :authenticate_user!, only: [:create, :edit, :update, :new, :destroy]
  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.build_item_photo
    @category = Category.roots
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      @category = Category.roots
      @item.build_item_photo
      render "new"
    end
  end

  def edit
    unless current_user.id == @item.seller_id 
      redirect_to root_path, notice: '商品の出品者ではありません'
    end
  end

  def update
    if @item.update(update_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      flash.now[:alert] = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if current_user == @item.seller
      @item.destroy
      redirect_to root_path
    else
      flash.now[:alert] = '商品の出品者ではありません'
      render :show
    end
  end

  def get_category
    selected_category=Category.find(params[:category_id])
    @category = selected_category.children
  end


 private
  def item_params
    params.require(:item).permit(:name, :price, :purchase, :buyer_id, :explanation, :category_id, :state_id, :brand, :delivery_fee_id, :delivery_area_id, :delivery_method_id, :shipment_date_id, item_photo_attributes: [:thumbnail]).merge(seller_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:name, :price, :purchase, :buyer_id, :explanation, :category_id, :state_id, :brand, :delivery_fee_id, :delivery_area_id, :delivery_method_id, :shipment_date_id, item_photo_attributes: [:thumbnail, :thumbnail_cache, :id, :_delete]).merge(seller_id: current_user.id)
  end
  
  def item_edit
    @item = Item.find(params[:id])
    @item_category = Category.find_by(id: @item.category_id)
    @item_category_parent = @item.category.parent
    @item_category_parent_children = @item_category_parent.children
    @item_category_root = @item_category.root
    @item_category_root_children = @item_category_root.children
    @category = Category.roots
    @photo = @item.item_photo
  end
end
