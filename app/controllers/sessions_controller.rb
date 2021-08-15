class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  # before_action :redirect_if_logged_in, except: [:logout]

  def welcome 
  end

  def signin
    if @user = User.find_by_email_address(params[:email_address])&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to organizations_path
    else
      @errors = "The password and/or email are incorrect"
      render 'welcome'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end

end
