class Location < ApplicationRecord
  belongs_to :subsection, optional: true
  belongs_to :gps_location
end
