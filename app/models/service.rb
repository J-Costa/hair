class Service < ApplicationRecord
  has_many :service_professionals
  has_many :professionals, through: :service_professionals, dependent: :destroy
  has_many :schedules

  has_one_attached :image
end
