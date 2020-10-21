class Mezoregion < ApplicationRecord
  belongs_to :macroregion
  has_many :gps_location
end
