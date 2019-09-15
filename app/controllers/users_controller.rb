class UsersController < ApplicationController
  def identification
    @address = Address.find(current_user.id)
    @user = User.find(current_user.id)
  end

  def show
  end

  def myitems
    @items = current_user.items
    # @item = Item.find.order("RAND(current_user)")
  end

  def check
    @user = ForbiddenWord.where(forbidden_word: user_params[:])
  end
end
