class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in
  
  private
  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end
end
