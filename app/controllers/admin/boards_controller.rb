class Admin::BoardsController < ApplicationController
  before_action :admin_user
  def index
    @reservations = Reservation.all
    @open_days = (Date.today..Date.today.advance(months:3)).select{|date| date.wday !=1}-Holiday.pluck(:closed_day)

  end

  def show
    # @bloks = Block.all
    @block_comment = Block.pluck(:block)
    block_num2 = Block.pluck(:id).count
    @reservation_day = Reservation.where(staff_id:params[:@staff_id]).where(reservation_date:params[:@day].to_date).pluck(:reservation_block).flatten
    @block_id = Block.pluck(:id)
    @day_status = Array.new
    @staff_name = Staff.where(id:params[:@staff_id]).pluck(:name) #viewでスタイリスト名を表示

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
