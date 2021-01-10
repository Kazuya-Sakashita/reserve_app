class ReservesController < ApplicationController

  def new
   @reservation = Reservation.new
  end
  def step1
    @reservation = Reservation.new
    @user = User.find_by(id: params[:id])
    @open_days = (Date.today..Date.today.advance(months:3)).select{|date| date.wday !=1}
  end
  def step2
    session[:staff_id] = reservation_params[:staff_id]
    session[:reservation_date] = reservation_params[:reservation_date].to_date 
    @reservation = Reservation.new
  end
  def step3
    session[:plan_id] = reservation_params[:plan_id]
    block_id = Plan.where(id:reservation_params[:plan_id]).pluck(:time_block)
    free_block = Block.pluck(:id)-Reservation.where(staff_id:session[:staff_id]).where(reservation_date:session[:reservation_date]).pluck(:reservation_block).flatten
    
    block_nums = Plan.where(id:reservation_params[:plan_id]).pluck(:time_block)
    block_num = block_nums.first.to_i-1
    block_num.times do |f| 
      new_free_block = free_block.map{|n|n-1}
      free_block = free_block & new_free_block
    end
    @reservation = Reservation.new
    @time_blocks = Block.where(id: [free_block])
  end
  def create
    @reservation = Reservation.new(
      staff_id: session[:staff_id],
      reservation_date: session[:reservation_date],
      plan_id: session[:plan_id],
    )
    block = (reservation_params[:reservation_block]).split()#ブロック番号（予約開始時間）
    temporary_block = reservation_params[:reservation_block]#計算するために一時保管する
      block_nums = Plan.where(id:session[:plan_id]).pluck(:time_block)#プランIDからブロックすうを検索
      block_num = block_nums.first.to_i-1
        block_num.times do |r| #必要ブロックを配列に追加
        temporary_block = ((temporary_block.to_i + 1).to_s)#プロック数に＋1
        block.push(temporary_block)#プロックに連続の数字を追加
      end
    @reservation.reservation_block = block.map(&:to_i)
    @reservation.user_id = current_user.id
    @reservation.status = 0
      if @reservation.save
        redirect_to reserves_show_path(current_user.id, @reservation)
      else
        render 'reserves/step1'
      end
  end

  def index
        @plans = Plan.all
  end

  def show
    @reservations = Reservation.where("user_id = #{current_user.id}" )
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