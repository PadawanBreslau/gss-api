class Location < ApplicationRecord
  belongs_to :subsection, optional: true
  belongs_to :gps_location

  has_many :trivia, as: :triviable
end
