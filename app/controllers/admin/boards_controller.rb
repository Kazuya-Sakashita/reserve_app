class Admin::BoardsController < ApplicationController
  before_action :admin_user
  def index
    @reservations = Reservation.all
  end

  def show
    @bloks = Block.all
    @block_comment = Block.pluck(:block)
    @day = "2021-02-11"
    @day = @day.to_date
    @reservation_day = Reservation.where(reservation_date:@day).pluck(:reservation_block).flatten!
    @blocks_all = Block.pluck(:id)


    @day_status = Array.new

    @blocks_all.each do |block_status|
      if @reservation_day.include?(block_status)
          @day_status.push "X"
      else
          @day_status.push "○"
      end
    end
    
    @status = @block_comment.zip(@day_status).to_h
  end




  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
  end

end
