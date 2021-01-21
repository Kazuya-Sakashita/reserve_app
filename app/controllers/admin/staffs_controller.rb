class Admin::StaffsController < ApplicationController

  def index
    @staff = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def create
      if Staff.create(staff_params)
        redirect_to admin_staffs_path
      else
        render 'index'
      end
  end
  def edit
    @staffs = Staff.all
    @staff = Staff.find_by(id: params[:id])
  end

  def show
    @staff = Staff.all
  end
  def destroy
    staff = Staff.find_by(id: params[:id])
    if staff.destroy 
      redirect_to admin_staffs_path
    else
      render:index
    end
  end
  def update
    @staff = Staff.find_by(id: params[:id])
      if @staff.update_attributes(staff_params)
        redirect_to admin_staffs_path
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

  def staff_params
    params.require(:staff).permit(:name)
  end
end
