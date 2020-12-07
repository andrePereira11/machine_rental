class CalendarDay < ApplicationRecord
  belongs_to :schedule

  def self.availability(date,number)
    return false unless number.kind_of?Integer
    return false if number < 1

    number.times do
      #byebug
      if CalendarDay.find_by(my_date: date)
        return false
      else
        date += 1
      end 
    end
  end

  #def self.availability(date)
    #Calendar.find_by(my_date:date) == nil ? true : false
  #end

end
