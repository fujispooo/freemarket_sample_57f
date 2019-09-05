class ItemsController < ApplicationController
  before_action :user_login,only:[:new, :show]

  WOMAN = 1
  MAN = 2
  OTHERS = 3

  def index
    @item = Item.order("created_at DESC").limit(4).where.not(item_state_id: 2)
    @items_for_woman = Category.get_items_for(WOMAN)
    @items_for_man = Category.get_items_for(MAN)
    @items_for_others = Category.get_items_for(OTHERS)
  end

  def show
  end

  def new
    @item = Item.new
    @item_image = ItemImage.new
    @categories = Category.where(parent_id:nil)
  end

  def create
  end

  def purchase
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
    item.destroy
    end
    redirect_to root_path
  end

  def transaction
  end
end
