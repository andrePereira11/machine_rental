class AddScheduleRefToCalendarDay < ActiveRecord::Migration[5.2]
  def change
    add_reference :calendar_days, :schedule, foreign_key: true
  end
end
