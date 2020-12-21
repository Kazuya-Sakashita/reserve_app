class ReservesController < ApplicationController

  def new
   @reservation = Reservation.new
  end

  def step1
    @reservation = Reservation.new
    @user = User.find_by(id: params[:id])
  end
  def step2
    session[:staff_id] = reservation_params[:staff_id]
    session[:reservation_date] = DateTime.new(params[:reservation]["reservation_date(1i)"].to_i,params[:reservation]["reservation_date(2i)"].to_i,params[:reservation]["reservation_date(3i)"].to_i)
    @reservation = Reservation.new
  end
  def step3
    session[:plan_id] = reservation_params[:plan_id]
    free_block = Block.pluck(:id)-Reservation.where(reservation_date:session[:reservation_date]).pluck(:reservation_block).map(&:to_i)
    @reservation = Reservation.new
    @time_blocks = Block.where(id: [free_block])
  end

  def create
    @reservation = Reservation.new(
      staff_id: session[:staff_id],
      reservation_date: session[:reservation_date],
      plan_id: session[:plan_id],
      reservation_block: reservation_params[:reservation_block] # step3で入力した値をインスタンスに渡す
    )
    @reservation.user_id = current_user.id
    @reservation.status = 0
      if @reservation.save
        redirect_to reserves_show_path(current_user.id, @reservation)
      else
        render 'reserves/step1'
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
    params  
      .require(:reservation)
      .permit(:plan_id, :user_id, :staff_id, :reservation_block, :status, :reservation_date )
  end

  def user_params
    params.require(:user).permit(:name, :address, :password, :password_confirmation, :birthday, :phone_number, :email, :etc)
  end

  def plan_params
    params.require(:plan).permit(:order, :price, :time, :description, :block_count)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end