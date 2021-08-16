class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in
  helper_method :current_user, :logged_in?
  
  private
  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end

  def redirect_if_unauthorized
    if(logged_in? && current_user.organization_id)
      redirect_to organization_path(@user.organization_id)
    else
      redirect_to organizations_path
    end
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
    # User.find_by_id(session[:user_id])
  end

end
