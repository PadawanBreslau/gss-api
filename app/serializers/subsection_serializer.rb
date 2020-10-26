class SubsectionSerializer
  include JSONAPI::Serializer

  has_many :locations
  has_many :trivia
  has_many :images

  attributes :track_color, :description, :start, :finish, :information, :section_order
end
