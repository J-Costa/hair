class Store < ApplicationRecord
  has_many :available_times, as: :timeable

  has_one_attached :image
end
