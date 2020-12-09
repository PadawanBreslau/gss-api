class Trivium < ApplicationRecord
  belongs_to :gps_location, optional: true
  belongs_to :triviable, polymorphic: true

  delegate :lat, :lon, to: :gps_location, allow_nil: true
end
