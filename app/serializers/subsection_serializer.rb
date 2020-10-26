class SubsectionSerializer
  include JSONAPI::Serializer

  attributes :track_color, :description, :start, :finish, :information, :section_order
end
