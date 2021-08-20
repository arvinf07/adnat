class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, except: [:welcome]
  # before_action :redirect_if_unauthorized, except: [:logout]

  def welcome 
    if @organization = current_user.organization
      render :template => "organizations/show"
    else
      @organizations = Organization.all 
      render :template => "organizations/index"
    end
  end

  def new
    redirect_to '/' if logged_in?
  end

  def create
    redirect_to '/' if logged_in?

    if @user = User.find_by_email_address(params[:email_address])&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = "The password and/or email are incorrect"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

end
