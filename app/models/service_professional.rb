class ServiceProfessional < ApplicationRecord
  belongs_to :service
  belongs_to :professional

  validates :service_id, uniqueness: { scope: :professional_id }
end
