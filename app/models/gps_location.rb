class GpsLocation < ApplicationRecord
  belongs_to :mezoregion, optional: true

  validates :lon, numericality: true, inclusion: -180..180
  validates :lat, numericality: true, inclusion: -90..90

  def to_s
    "#{lon}, #{lat}"
  end
end
