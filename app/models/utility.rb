class Utility < ApplicationRecord
  belongs_to :gps_location
  belongs_to :location, optional: true

  has_many :trivia, as: :triviable
  has_many :images, as: :imagable
  enum utility_type: [:accomodation, :food_and_accomodation, :restaurant,
                      :petrol_station, :shop, :bus_stop, :train_station]

  store :information, accessors: [:address, :phone_number, :website]
end
