# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate , only: [:new]
  def destroy
    super
    session[:keep_signed_out] = true
  end

  def new
  end
end
