class SessionsController < ApplicationController

  def new
    @user = User.new
  end


  def create
    # メール & 電話での実装
    user = User.find_by(email: params[:email].downcase)
    if user.nil?
      user = User.find_by(phone_number: params[:phone_number].downcase)
    end
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to users_show_path(user.id)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end


end
