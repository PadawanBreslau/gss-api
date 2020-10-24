class Mezoregion < ApplicationRecord
  belongs_to :macroregion
  has_many :gps_location
  has_many :trivia, as: :triviable
end
