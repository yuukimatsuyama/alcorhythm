class SchedulesController < ApplicationController
  before_action :set_begining_of_week
  add_flash_types :danger

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
    @schedule_count = @schedule.schedule_count
    @amount_average = Schedule.average(:amount).round
  end

  def show
    @schedule = Schedule.find(params[:id])
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
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_parameter)
      redirect_to schedules_path
    else
      render 'edit'
    end
  end

  private

  def set_begining_of_week
    Date.beginning_of_week = :sunday
  end


  def schedule_params
    params.require(:schedule).permit(:alcohol_id, :percentage, :amount, :start_time).merge(user_id: current_user.id)
  end

end
