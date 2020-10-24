class Subsection < ApplicationRecord
  belongs_to :section
  enum track_color: [:without_track, :red, :blue, :green, :yellow, :black]
  store :information, accessors: [:length, :ascent, :descent]

  validates :section_order, uniqueness: { scope: [:section_id] }
end
