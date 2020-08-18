# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_user
     User.where(id: session[:user_id]).first
    # User.where(id: session[:id]).first
  end
  helper_method :current_user
end
