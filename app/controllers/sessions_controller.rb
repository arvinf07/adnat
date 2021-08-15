class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  # before_action :redirect_if_logged_in, except: [:logout]

  def welcome 

  end

  def signin
  end

  def logout
    reset_session
    redirect_to '/'
  end

end
