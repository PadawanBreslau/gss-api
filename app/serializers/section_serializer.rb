class SectionSerializer
  include JSONAPI::Serializer

  has_many :subsections
  has_many :locations
  has_many :utilities
  has_many :trivia
  has_many :images

  attributes :start, :finish, :description, :order, :variation,
             :length, :total_length, :ascent, :descent, :mt_uuid
end
