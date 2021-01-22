class Admin::BoardsController < ApplicationController
  before_action :admin_user
  def index
    @reservations = Reservation.all
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
  end

end
