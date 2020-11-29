class ReservesController < ApplicationController

  def new
   @user = User.find(params[:users_id])
   @reservation = Reservation.new
  end

  def create
    @user = User.find(params[:users_id])
    @reservation = current_user.reservations.build(reservation_params)
      if @reservation.save
        redirect_to reserves_show_path(@user, @reservation)
      else
        render 'new'
    end
  end

  def index
  end

  def show
    @user_id = current_user.id
    @reservations = Reservation.where("user_id = #{@user_id}" )
  end

  def edit
  end

  private

  def reservation_params
    params.require(:reservation).permit(:plan_id, :user_id, :event_id, :reservation_date)
  end

  def user_params
    params.require(:user).permit(:name, :address, :password, :password_confirmation, :birthday, :phone_number, :email, :etc)
  end


  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end