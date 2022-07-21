class SchedulesController < ApplicationController
  before_action :set_begining_of_week
  before_action :set_schedule,only: [:show, :edit, :destroy, :update]
  add_flash_types :danger

  def index
    @schedules = current_user.schedules
    @schedule = Schedule.new
    @schedule_ave = Schedule.where(user_id: current_user).average(:amount)
  end

  def show
  end

  def create
    @schedule = Schedule.create(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      redirect_to root_path, alert: "※正しく保存されませんでした。もう一度入力してください。"
   end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render 'edit'
    end
  end

  private

  def set_begining_of_week
    Date.beginning_of_week = :sunday
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:alcohol_id, :percentage, :amount, :start_time).merge(user_id: current_user.id)
  end

end
