class GpsLocation < ApplicationRecord
  extend Utils

  belongs_to :mezoregion, optional: true
  has_many :trivium

  validates :lon, numericality: true, inclusion: -180..180
  validates :lat, numericality: true, inclusion: -90..90

  Mezoregion.pluck(:id, :name).each do |id, name|
    scope normalize(name).to_sym, -> { where(mezoregion_id: id) }
  end

  def to_s
    internal_description + " #{lon.round(6)}, #{lat.round(6)}"
  end
end
