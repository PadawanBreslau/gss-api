class UtilitySerializer
  include JSONAPI::Serializer

  has_one :gps_location
  has_many :trivia
  has_many :images

  attributes :information, :utility_type, :name
end
