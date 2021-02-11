class Admin::BoardsController < ApplicationController
  before_action :admin_user
  def index
    @reservations = Reservation.all
  end

  def show
    @bloks = Block.all
    @block_comment = Block.pluck(:block)
    @staff_id = "1"
    @day = "2021-02-11"
    @day = @day.to_date
    
    @reservation_day = Reservation.where(staff_id:@staff_id).where(reservation_date:@day).pluck(:reservation_block).flatten
    @blocks_all = Block.pluck(:id)


    @day_status = Array.new　#表示のための○Xの配列を作成
    if  @reservation_day.nil?#予約なしの場合
      block_num2 = Block.pluck(:id).count#配列個数カウント
      block_num2.times do |f| #配列個数分push繰返
        @day_status.push "○"
        end
    elsif
        @block_id.each do |block_status|
        if @reservation_day.include?(block_status)#予約ありはXを表示（判定）
          @day_status.push "X"
        else
          @day_status.push "○"
        end
      end
    end
    @status = @block_comment.zip(@day_status).to_h #表示のために並べてハッシュ
  end




  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
  end

end
