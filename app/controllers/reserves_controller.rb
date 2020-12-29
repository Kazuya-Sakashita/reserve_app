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
binding.pry

    free_block = Block.pluck(:id)-Reservation.where(reservation_date:session[:reservation_date]).pluck(:reservation_block).flatten
    # block_number = reserevation.plan.time_block

    2.times do |f| #一旦2回で試す
    new_free_block = free_block.map{|n|n-1}
    free_block = free_block & new_free_block
    end


    @reservation = Reservation.new
    @time_blocks = Block.where(id: [free_block])
  end

  def create
binding.pry



    @reservation = Reservation.new(
      staff_id: session[:staff_id],
      reservation_date: session[:reservation_date],
      plan_id: session[:plan_id],
      # reservation_block:reservation_params[:reservation_block]
    )
    # @block1 = reservation_params[:reservation_block]
    # @block2 = reservation_params[:reservation_block]
    # @block2 = @block2.to_i + 1
    # @block3 = @block2.to_i + 1
    # @block1 = @block1.to_s.split()
    # @block2 = @block2.to_s.split()
    # @block3 = @block3.to_s.split()
    # @block = @block1 + @block2 + @block3

    @block = (reservation_params[:reservation_block]).split()
    @temporary_block = reservation_params[:reservation_block]
      2.times do |r| #一旦2回で試す
        @temporary_block = ((@temporary_block.to_i + 1).to_s)
        @block.push(@temporary_block)
      end

# binding.pry

    @reservation.reservation_block = @block.map(&:to_i)
# binding.pry
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