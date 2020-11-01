class Subsection < ApplicationRecord
  belongs_to :section
  has_many :trivia, as: :triviable
  has_many :images, as: :imagable
  has_many :locations
  has_many :utilities

  enum track_color: [:without_track, :red, :blue, :green, :yellow, :black]
  store :information, accessors: [:length, :ascent, :descent]

  validates :section_order, uniqueness: { scope: [:section_id] }
  validate :proper_order_order, on: :create

  default_scope { order section_id: :asc, section_order: :asc }

  def title
    "#{start} - #{finish}"
  end

  def proper_order_order
    unless proper_order_kept?
      errors.add(:section_order, 'add subsections in proper order within section')
    end
  end

  def previous_subsection
    section.subsections.find_by(section_order: section_order - 1)&.id
  end

  def next_subsection
    section.subsections.find_by(section_order: section_order + 1)&.id
  end

  private

  def proper_order_kept?
    first_one_is_zero? || next_ones_are_following?
  end

  def first_one_is_zero?
    section_order.zero? && section&.subsections.blank?
  end

  def next_ones_are_following?
    section&.subsections.present? &&
      section_order == section.subsections.map(&:section_order).max + 1
  end
end
