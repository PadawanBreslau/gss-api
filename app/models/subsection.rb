class Subsection < ApplicationRecord
  belongs_to :section
  enum track_color: [:without_track, :red, :blue, :green, :yellow, :black]

  validates :section_order, uniqueness: { scope: [:section_id] }
end
