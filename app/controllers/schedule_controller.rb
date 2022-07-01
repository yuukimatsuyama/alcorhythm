class ScheduleController < ApplicationController
  before_action :set_begining_of_week


  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end
  
  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def create
    schedule.create(Schedule_parameter)
    redirect_to schedules_path
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice:"削除しました"
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_parameter)
      redirect_to schedules_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def set_begining_of_week
    Date.beginning_of_week = :sunday
  end

  def schedule_parameter
    params.require(:schedule).permit(:title, :content, :start_time)
  end

end
