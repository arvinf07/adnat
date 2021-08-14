class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  before_action :redirect_if_logged_in

  def welcome 

  end

  def signin
  end

end
