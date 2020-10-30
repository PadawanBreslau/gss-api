class LocationSerializer
  include JSONAPI::Serializer

  has_one :gps_location
  has_many :trivia
  has_many :images

  attributes :name, :description, :attraction, :subsection_order, :subsection_id
end
