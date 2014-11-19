class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      OrderInfo.find(session[:order_id])
    else
      OrderInfo.new
    end
  end

  # before_action :authenticate_user!
  # before_action :user_signed_in?
  # before_action :current_user
  # before_action :user_session
  
end
