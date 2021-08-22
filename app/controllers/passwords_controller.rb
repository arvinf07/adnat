class PasswordsController < ApplicationController
  
  def edit
    current_user
  end

  def update
    if current_user.authenticate(params[:user][:old_password]) && @user.update(password_params)
      redirect_to @user, notice: 'You have succesfully changed your password.'
    else
      flash.now[:alert] = 'Make sure that old password is correct and new password matches the confirmation'
      render 'edit', status: 403
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :old_password)
  end

end
