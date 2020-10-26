class SectionsSerializer
  include JSONAPI::Serializer

  attributes :start, :finish, :description, :order, :variation
end
