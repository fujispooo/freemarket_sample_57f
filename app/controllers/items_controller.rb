class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
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
end
