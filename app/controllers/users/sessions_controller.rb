# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user! , only: [:new, :create]
  def destroy
    super
    session[:keep_signed_out] = true
  end

  def new
    super
  end
  
  def create
    super
  end
end
