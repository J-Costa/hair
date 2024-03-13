class Professional < ApplicationRecord
  has_secure_password

  has_many :service_professionals
  has_many :services, through: :service_professionals
  has_many :available_times, as: :timeable

  has_one_attached :avatar
end
