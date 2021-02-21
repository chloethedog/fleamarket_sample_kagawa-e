class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy]
  before_action :item_edit, only: [:edit, :update]
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @items = Item.where(purchase: 0).order('created_at DESC').limit(10)
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @items = Item.where(purchase: 0, seller_id: @item.seller).order('created_at DESC').limit(10)
    @category = Item.where(purchase: 0, category_id: @item.category).order('created_at DESC').limit(10)
    @favorites = Favorite.where(item_id: @item.id)
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
      flash.now[:alert] = @item.errors.full_messages
      @category = Category.roots
      @item.build_item_photo
      flash.now[:alert] = @item.errors.full_messages
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
  
  def search
    @items = Item.search(params[:keyword])
    @search = @items.size
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

  def set_item
    begin
      @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path,notice: "ご指定のアイテムが見つかりません。"  
    end
  end
  
end
