class TriviumSerializer
  include JSONAPI::Serializer

  attributes :content, :lon, :lat
end
