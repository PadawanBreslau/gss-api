class Image < ApplicationRecord
  belongs_to :imagable, polymorphic: true
  has_one_attached :picture

  store :information, accessors: [:author, :licence, :description]
end
