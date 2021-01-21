class Admin::HolidaysController < ApplicationController
  before_action :if_not_admin

  def index
    @holiday = Holiday.all
  end
  def new
    @holiday = Holiday.new
  end

  def create
      if Holiday.create(holiday_params)
        redirect_to admin_holidays_path
      else
        render 'index'
      end
  end


  def show
    @holiday = Holiday.all
  end
  def destroy
    holiday = Holiday.find_by(id: params[:id])
    if holiday.destroy 
      redirect_to admin_holidays_path
    else
      render:index
    end
  end
  def update
    holiday = Holiday.find_by(id: params[:id])
      if @holiday.update_attributes(plan_params)
        redirect_to admin_holidays_path
      else
        render:index
      end
  end


  private
  def if_not_admin
    redirect_to root_path 
    unless 
      current_user.admin?
    end
  end
  def holiday_params
    params.require(:holiday).permit(:closed_day)
  end
end