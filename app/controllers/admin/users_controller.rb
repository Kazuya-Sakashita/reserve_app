class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user

  def index
    @users = User.all.order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def show
    @users = User.all
    @user = User.find_by(id: params[:id])
  end

  def edit
    @users = User.all
    @user = User.find_by(id: params[:id])
  end

  def update
    @users = User.all
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_user_path
    else
      render :edit
    end
  end

  def destroy
    @users = User.all
    user = User.find_by(id: params[:id])
    if user.destroy
      redirect_to admin_users_path
    else
      render :index
    end
  end

  def set_user
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :password, :password_confirmation, :birthday, :phone_number, :email, :etc)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
