class Admin::PlansController < ApplicationController
  before_action :admin_user

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
      if @plan = Plan.create(plan_params)
        redirect_to admin_plans_path
      else
        render 'new'
      end
  end


  def show
    @plans = Plan.all
    @plan = Plan.find_by(id: params[:id])
  end

  def edit
    @plans = Plan.all
    @plan = Plan.find_by(id: params[:id])
  end

  def update
      @plan = Plan.find_by(id: params[:id])
      if @plan.update_attributes(plan_params)
        redirect_to admin_plans_path
      else
        render:edit
      end
  end

  def destroy
    @plans = Plan.all
    plan = Plan.find_by(id: params[:id])
    if plan.destroy 
      redirect_to admin_plans_path
    else
      render:index
    end
  end

  private
    def plan_params
      params.require(:plan).permit(:order, :price, :time, :description)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
