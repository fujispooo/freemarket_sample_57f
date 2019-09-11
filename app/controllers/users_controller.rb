class UsersController < ApplicationController
  def identification
    @address = Address.find(current_user.id)
    @user = User.find(current_user.id)
  end

  def show
  end

  def mypage
  end
end
