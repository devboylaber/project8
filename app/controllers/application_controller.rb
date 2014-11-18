class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :authenticate_user!
  # before_action :user_signed_in?
  # before_action :current_user
  # before_action :user_session

  # before_action :authenticate_admin!
  # before_action :admin_signed_in?
  # before_action :current_admin
  # before_action :admin_session
  
end
