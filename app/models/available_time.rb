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
  scope :only_free, -> { where(free: true) }

  def weekday_name
    WEEKDAYS[weekday.to_s]
  end
end
