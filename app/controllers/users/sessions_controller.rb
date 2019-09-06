# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def destroy
    super
    session[:keep_signed_out] = true
  end
end
