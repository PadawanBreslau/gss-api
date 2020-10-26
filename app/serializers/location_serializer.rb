class LocationSerializer
  include JSONAPI::Serializer

  has_one :gps_location
  attributes :name, :description, :attraction, :subsection_order
end
