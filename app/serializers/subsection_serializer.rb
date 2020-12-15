class SubsectionSerializer
  include JSONAPI::Serializer

  has_many :locations
  has_many :utilities
  has_many :trivia, if: ->(_, params) { params.fetch(:trivia, false) }
  has_many :images, if: ->(_, params) { params.fetch(:images, false) }

  attributes :track_color, :description, :start, :finish,
             :length, :ascent, :descent, :section_order, :mt_uuid,
             :horizontal_map
end
