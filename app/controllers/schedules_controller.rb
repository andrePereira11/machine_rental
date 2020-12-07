class SchedulesController < ApplicationController
  def create
    @schedule = schedule.new(schedule_params)

    if @schedule.save
      @schedule.generate_dates
      redirect_to @schedule
    else
      render :new
    end
  end

  private
    def schedule_params
      params.require(:scheddule).permit(:name, :initial_date, :number_of_days) 
    end
end