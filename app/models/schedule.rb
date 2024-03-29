# Classe que agenda data
class Schedule < ApplicationRecord
  has_many :calendar_days

  # validations
  validates :initial_date, presence: true
  validates :number_of_days, presence: true
  validates :number_of_days, numericality: { greater_than: 0, only_integer: true }
  validates :number_of_days, length: { minimum: 1 }
  validate :check_dates
  validate :date_cannot_be_in_the_past

  def generate_dates
    date = initial_date
    number_of_days.times do
      calendar_days.new(my_date: date).save
      date += 1
    end
  end

  def check_dates
    if CalendarDay.availability(initial_date, number_of_days)
      true
    else
      errors.add(:initial_date, 'unavailable dates')
      false
    end
  end

  # Metodo que valida se a data é inferior a Hoje ou igual a hoje
  def date_cannot_be_in_the_past
    if initial_date.present? && initial_date < Date.current + 1         # Pensei em um cenario que não faz muito sentido alugar no mesmo dia, por isso o +1
      errors.add(:initial_date, "can't be in the past")
    end
  end
end
