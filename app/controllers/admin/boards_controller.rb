class Admin::BoardsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
end
