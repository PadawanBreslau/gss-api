class GpsLocation < ApplicationRecord
  extend Utils

  belongs_to :mezoregion, optional: true
  has_many :trivium

  validates :lon, numericality: true, inclusion: -180..180
  validates :lat, numericality: true, inclusion: -90..90

  def to_s
    internal_description + " #{lon.round(6)}, #{lat.round(6)}"
  end
end
