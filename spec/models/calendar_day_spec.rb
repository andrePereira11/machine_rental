require 'rails_helper'

RSpec.describe CalendarDay, type: :model do
  it 'checks success story' do
    schedule = Schedule.create(name:'Andre',initial_date:Date.current + 1, number_of_days:3)
    schedule.generate_dates

    expect(schedule.calendar_days[0].my_date).to eq Date.current + 1
  end

  it 'check if number is less than or equal to 0' do
    day = CalendarDay.availability(Date.current + 1, -3)

    expect(day).to be false
  end
end
