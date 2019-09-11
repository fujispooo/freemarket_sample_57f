class UsersController < ApplicationController
  def identification
    # @item = Item.find(params[:item_id])
    @address = Address.find(current_user.id)
    @user = User.find(current_user.id)
  end

  def show
  end

  def mypage
  end

  def myitems
    @items = current_user.items
    # @item = Item.find.order("RAND(current_user)")
  end

  # def myitems
  #   @item = current_user.item.find(params[:id])
  # end

end
