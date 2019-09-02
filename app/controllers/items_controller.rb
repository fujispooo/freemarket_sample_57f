class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
    @item_image = ItemImage.new
    @categories = Category.where(parent_id:nil)
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
