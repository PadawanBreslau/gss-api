class GpsLocationSerializer
  include JSONAPI::Serializer

  attributes :lat, :lon
end
