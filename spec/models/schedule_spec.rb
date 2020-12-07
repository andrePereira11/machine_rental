require 'rails_helper'

RSpec.describe Schedule, type: :model do
  context "filled fields" do
    it 'checks success story' do
      schedule = Schedule.create(name:'Andre',initial_date:Date.current + 1, number_of_days:3)

      expect(schedule).to be_valid  
    end

    it 'checks if date is less than or equal to today' do
    end

    it 'check if number of days is not a number' do
    end

    it 'checks if number of days is greater than 0' do
    end

    it 'check error message if date is unavailable' do
    end
  end

  context "unfilled fields" do
    it 'checks error message if fields are blank' do
    end
  end
  
end
