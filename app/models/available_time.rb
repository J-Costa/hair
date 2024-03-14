class AvailableTime < ApplicationRecord
  WEEKDAYS = {
    "0": "Domingo",
    "1": "Segunda-feira",
    "2": "Terça-feira",
    "3": "Quarta-feira",
    "4": "Quinta-feira",
    "5": "Sexta-feira",
    "6": "Sábado"
}.with_indifferent_access

  belongs_to :timeable, polymorphic: true
  scope :only_future, -> { where(weekday: Date.today.wday...) }
  scope :only_free, -> { where(free: true) }

  def weekday_name
    WEEKDAYS[weekday.to_s]
  end

  def free_hours
    current_hour = Time.now.hour
    (start...finish).reject { |hour| Date.today.wday == weekday && hour <= current_hour }.map do |hour|
      format("%02d:00", hour)
    end
  end
end
