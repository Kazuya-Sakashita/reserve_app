class Admin::HolidaysController < ApplicationController
  before_action :admin_user
  def index
    @holidays = Holiday.all
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @reservation_check = DateTime.new(params[:holiday]['closed_day(1i)'].to_i, params[:holiday]['closed_day(2i)'].to_i,
                                      params[:holiday]['closed_day(3i)'].to_i)
    @reservation_day = Reservation.where(reservation_date: @reservation_check)
    if @reservation_day.empty?
      Holiday.create(holiday_params)
      redirect_to admin_holidays_path and return
    else
      redirect_to admin_holidays_path flash[:alert] = '予約が入ってる可能性があります、確認ください' and return
    end
  end

  def show
    @holidays = Holiday.all
    @holiday = Holiday.new
    @reservations = Reservation.all
  end

  def destroy
    holiday = Holiday.find_by(id: params[:id])
    if holiday.destroy
      redirect_to admin_holidays_path
    else
      render :index
    end
  end

  def update
    holiday = Holiday.find_by(id: params[:id])
    if @holiday.update_attributes(plan_params)
      redirect_to admin_holidays_path
    else
      render :index
    end
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def holiday_params
    params.require(:holiday).permit(:closed_day)
  end
end
