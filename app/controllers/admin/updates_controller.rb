class Admin::UpdatesController < ApplicationController
  before_action :admin_user

  def index
    @updates = Update.all
  end

  def new
    @update = Update.new
  end
  def create
      if Update.create(update_params)
        redirect_to admin_updates_path
      else
        render 'new'
      end
  end

  def show
    @Update = Update.find_by(id: params[:id])
  end

  def edit
    @updates = Update.all
    @update= Update.find_by(id: params[:id])
  end
  def update
      @update = Update.find_by(id: params[:id])
      if @update.update_attributes(update_params)
        redirect_to admin_updates_path
      else
        render:edit
      end
  end
  def destroy
    update = Update.find_by(id: params[:id])
    if update.destroy 
      redirect_to admin_updates_path
    else
      render:index
    end
  end

  private
    def update_params
      params.require(:update).permit(:date, :title, :content)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
