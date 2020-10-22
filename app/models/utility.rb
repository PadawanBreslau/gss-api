class Utility < ApplicationRecord
  belongs_to :gps_location
  belongs_to :location, optional: true

  enum utility_type: [:accomodation, :food_and_accomodation, :restaurant,
                      :petrol_station, :shop, :bus_stop, :train_station]
end
