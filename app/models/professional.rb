class Professional < ApplicationRecord
  has_secure_password

  has_many :services
  has_many :available_times, as: :timeable
end
