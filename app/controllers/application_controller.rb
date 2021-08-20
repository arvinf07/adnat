class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in
  helper_method :current_user, :logged_in?
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    redirect_to '/'
  end

  private

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to '/login' unless logged_in?
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end
end
