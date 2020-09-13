class UsersController < ApplicationController
 
  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_show_path
    else
      render 'new'
    end

  end

  def show
     @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :address, :password, :password_confirmation, :birthday, :contact, :mail, :etc)
  end

end