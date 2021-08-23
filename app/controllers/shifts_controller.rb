class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[show edit update destroy]

  # GET /shifts or /shifts.json
  def index
    if @organization = current_user.organization
      @shifts = sort_shifts(@organization.shifts.flatten)
    else
      redirect_to '/'
    end
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
    
  end

  # POST /shifts or /shifts.json
  def create
    @shift = current_user.shifts.build(shift_params)
    byebug
    if @shift.save
      redirect_to shifts_path, notice: 'Shift was successfully created.'
    else
      render 'new'
    end
  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    if @shift.update(shift_params)
      redirect_to shifts_path, notice: 'Shift was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shift
    @shift = Shift.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shift_params
    params
    .require(:shift).permit(:user_id, :start, :finish, :break_length)
    .merge(organization_id: current_user.organization_id)
  end

  def sort_shifts(shifts)
    shifts.sort { |a, b| b.start <=> a.start }
  end
end
