class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to users_show_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])    
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :address, :password, :password_confirmation, :birthday, :phone_number, :email, :etc)
  end
end