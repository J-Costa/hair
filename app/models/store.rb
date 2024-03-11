class Store < ApplicationRecord
  has_many :available_times, as: :timeable
end
