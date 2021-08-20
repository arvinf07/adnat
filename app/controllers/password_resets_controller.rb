class PasswordResetsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in

  def new
  end

  def create
    if @user = User.find_by_email_address(params[:email_address])
      PasswordMailer.with(user: @user).reset.deliver_later
    end
    redirect_to '/login', notice: "If an account with that email was found, we have sent a link to reset password"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to '/login', alert: 'Your token has expired. Please try again'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to '/login', notice: "Your password was reset succesfully. Please sign in."
    else 
      render 'edit'
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
