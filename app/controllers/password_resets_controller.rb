class PasswordResetsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in

  def new
  end

  def create
    if @user = User.find_by_email_address(params[:email_address])
      PasswordMailer.with(user: @user).reset.deliver_later
    end
    redirect_to '/', notice: "If an account with that email was found, we have sent a link to reset password"
  end

  def edit
  end

  def update
  end

end
