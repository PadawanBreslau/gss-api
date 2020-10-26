class MezoregionSerializer
  include JSONAPI::Serializer

  has_one :macroregion

  attributes :name
end
