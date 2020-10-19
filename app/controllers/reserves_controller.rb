class ReservesController < ApplicationController

  def new
   @reserve = Reservation.new
  end

  def create

  end

  end

  def index
  end

  def show

  end

  def edit
  end

  def reserve_params
    params.require(:user).permit(:name, :address, :password, :password_confirmation, :birthday, :contact, :mail, :etc)
  end


