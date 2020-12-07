class ReservesController < ApplicationController

  def new
   @reservation = Reservation.new
  end

  def step1
    @reservation = Reservation.new
    @user = User.find_by(id: params[:id])

  end

  def step2
    # step1で入力した値をsessionに保存
    session[:staff_id] = reservation_params[:staff_id]
    session[:reservation_date] = reservation_params[:reservation_date]
    @reservation = Reservation.new

  end
  def step3
    # step2で入力した値をsessionに保存
    session[:plan_id] = reservation_params[:plan_id]
    @reservation = Reservation.new

  end

  def create
    # binding.pry
    @reservation = Reservation.new(
      staff_id: session[:staff_id],
      reservation_date: session[:reservation_date],
      plan_id: session[:plan_id],
      reservation_block: reservation_params[:reservation_block] # step3で入力した値をインスタンスに渡す
    )
    @reservation.user_id = current_user.id
    @reservation.status = 0
    # binding.pry

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
    params.require(:reservation).permit(:plan_id, :user_id, :staff_id, :reservation_date, :reservation_block, :status)
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