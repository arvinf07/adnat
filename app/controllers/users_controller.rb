class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :redirect_if_not_logged_in

  def join
    current_user.update(organization_id: params[:id])
    redirect_to '/'
  end

  def leave
    current_user.update(organization_id: nil)
    @user.shifts.destroy_all
    redirect_to '/'
  end

  # GET /users/1 or /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    redirect_to '/' if logged_in?
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :organization_id)
  end
end
