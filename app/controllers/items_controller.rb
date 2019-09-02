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


end
