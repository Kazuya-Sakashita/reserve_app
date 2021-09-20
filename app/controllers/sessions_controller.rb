class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # メール & 電話での実装
    user = User.find_by(email: params[:email].downcase)
    # if user.nil?
    #   user = User.find_by(phone_number: params[:phone_number].downcase)
    # end
    # if user.nil?
    #   redirect_to login_path, alert: "you have to login" and return
    # end

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to users_show_path(user.id) and return
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new' and return
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'you have successfully logout'
  end
end
