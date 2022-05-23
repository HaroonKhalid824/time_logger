# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  def index
    @attendances = current_user.attendances.paginate(page: params[:page], per_page: 5)
  end

  # GET /attendances/1
  def show; end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit; end

  # POST /attendances
  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      redirect_to @attendance, notice: 'Attendance was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /attendances/1
  def update
    if @attendance.update(attendance_params)
      redirect_to @attendance, notice: 'Attendance was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attendances/1
  def destroy
    @attendance.destroy
    redirect_to attendances_url, notice: 'Attendance was successfully destroyed.'
  end

  def clock_in
    redirect_to attendances_url, alert: 'Please clock out first.' and return if last_attendance.present? && last_attendance.pending?

    clock_in = current_user.attendances.new(time_in: Time.current)

    if clock_in.save
      redirect_to attendances_url, notice: 'Attendance was successfully updated.'
    else
      redirect_to attendances_url, alert: 'Attendance was not successfully updated.'
    end
  end

  def clock_out
    redirect_to attendances_url, alert: 'Please clock in first.' and return if !last_attendance.present? || (last_attendance.present? && last_attendance.marked?)

    clock_out = current_user.attendances.last
    if clock_out.update(time_out: Time.current)
      redirect_to attendances_url, notice: 'Attendance was successfully updated.'
    else
      redirect_to attendances_url, alert: 'Attendance was not successfully updated.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def last_attendance
    current_user.attendances.last
  end

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def attendance_params
    params.require(:attendance).permit(:user_id, :time_in, :time_out, :status)
  end
end
