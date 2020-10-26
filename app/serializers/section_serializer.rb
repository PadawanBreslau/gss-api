class SectionSerializer
  include JSONAPI::Serializer

  has_many :subsections
  has_many :trivia
  has_many :images

  attributes :start, :finish, :description, :order, :variation
end
