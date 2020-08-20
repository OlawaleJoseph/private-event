# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def current_user
     User.where(id: session[:user_id]).first
    # User.where(id: session[:id]).first
  end

  def authenticate_user
    redirect_to login_path unless current_user
 end


  helper_method :current_user
end
