class Image < ApplicationRecord
  belongs_to :imagable, polymorphic: true
  has_one_attached :picture

  store :information, accessors: [:author, :licence, :description, :url]

  scope :section, -> { where(imagable_type: 'Section') }
  scope :subsection, -> { where(imagable_type: 'Subsection') }
  scope :utility, -> { where(imagable_type: 'Utility') }
  scope :location, -> { where(imagable_type: 'Location') }

  def delete_picture; end
end
