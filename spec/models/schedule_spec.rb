require 'rails_helper'

RSpec.describe Schedule, type: :model do
  context "filled fields" do
    it 'checks success story' do
      schedule = Schedule.create(name:'Andre',initial_date:Date.current + 1, number_of_days:3)
      schedule.generate_dates

      expect(schedule).to be_valid
      expect(schedule.number_of_days).to be_a_kind_of(Integer)
      expect(schedule.number_of_days).to be > 0
      expect(schedule.calendar_days[0].my_date).to eq Date.current + 1
      expect(schedule.calendar_days[1].my_date).to eq Date.current + 2
      expect(schedule.calendar_days[2].my_date).to eq Date.current + 3
    end

    it 'checks if date is less than or equal to today' do
      schedule = Schedule.create(name:'Andre',initial_date:'2019-12-05', number_of_days:3)

      expect(schedule).not_to be_valid
      expect(schedule.errors[:initial_date]).to include 'can\'t be in the past'
    end

    it 'check if number of days is not a number' do
      schedule = Schedule.create(name:'Andre',initial_date:Date.current + 1, number_of_days:'text')

      expect(schedule).not_to be_valid
      expect(schedule.errors[:number_of_days]).to include 'is not a number'
    end

    it 'checks if number of days is greater than 0' do
      schedule = Schedule.create(name:'Andre',initial_date:Date.current + 1, number_of_days:-2)

      expect(schedule).not_to be_valid
      expect(schedule.errors[:number_of_days]).to include 'must be greater than 0'
    end

    it 'check error message if date is unavailable' do
      schedule = Schedule.create(name:'Andre',initial_date:Date.current + 1, number_of_days:3)
      schedule.generate_dates
      schedule2 = Schedule.create(name:'Andre',initial_date:Date.current + 2, number_of_days:3)
      schedule2.generate_dates

      expect(schedule2).not_to be_valid
      expect(schedule2.errors[:initial_date]).to include 'unavailable dates'
    end
  end

  context "unfilled fields" do
    it 'checks error message if fields are blank' do
      schedule = Schedule.create

      expect(schedule).not_to be_valid
      expect(schedule.errors[:initial_date]).to include 'can\'t be blank'
      expect(schedule.errors[:number_of_days]).to include 'can\'t be blank'
    end
  end
  
end
