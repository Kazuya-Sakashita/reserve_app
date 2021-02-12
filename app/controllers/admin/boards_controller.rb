class Admin::BoardsController < ApplicationController
  before_action :admin_user
  def index
    @reservations = Reservation.all
  end

  def show
    @bloks = Block.all
    @block_comment = Block.pluck(:block)
    @staff_id = "1"
    @day = "2021-02-10"
    @day = @day.to_date
    block_num2 = Block.pluck(:id).count
    @reservation_day = Reservation.where(staff_id:@staff_id).where(reservation_date:@day).pluck(:reservation_block).flatten
    @block_id = Block.pluck(:id)
    @day_status = Array.new

    if  
      @reservation_day.nil?
      block_num2.times do |f|
        @day_status.push "○"
        end
    elsif
        @block_id.each do |block_status|
          if @reservation_day.include?(block_status)
            @day_status.push "X"
          else
            @day_status.push "○"
          end
      end
    end
    @status = @block_comment.zip(@day_status).to_h
  end




  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
  end

end
