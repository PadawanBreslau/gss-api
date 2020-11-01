class Utility < ApplicationRecord
  belongs_to :gps_location
  belongs_to :location, optional: true
  belongs_to :subsection, optional: true

  has_many :trivia, as: :triviable
  has_many :images, as: :imagable
  enum utility_type: [:accommodation, :food_and_accommodation, :restaurant,
                      :petrol_station, :shop, :bus_stop, :train_station]

  store :information, accessors: [:address, :phone_number, :website]
end
