class AvailableTime < ApplicationRecord
  belongs_to :professional, optional: true
  belongs_to :store, optional: true
end
