class SubsectionSerializer
  include JSONAPI::Serializer
  has_many :locations

  attributes :track_color, :description, :start, :finish, :information, :section_order
end
