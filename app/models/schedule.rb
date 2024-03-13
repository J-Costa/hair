class Schedule < ApplicationRecord
  belongs_to :service
  belongs_to :professional
  belongs_to :customer
end
