class SectionSerializer
  include JSONAPI::Serializer

  has_many :subsections
  attributes :start, :finish, :description, :order, :variation
end
