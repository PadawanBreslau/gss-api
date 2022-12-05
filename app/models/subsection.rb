class Subsection < ApplicationRecord
  belongs_to :section, autosave: true
  has_many :trivia, as: :triviable
  has_many :images, as: :imagable
  has_many :locations
  has_many :utilities

  enum track_color: [:without_track, :red, :blue, :green, :yellow, :black]
  store :information, accessors: [:length, :ascent, :descent]

  validates :section_order, uniqueness: { scope: [:section_id] }
  validate :proper_order_order, on: :create

  default_scope { order section_id: :asc, section_order: :asc }

  scope :main, -> { joins(:section).where('sections.variation = 0') }
  scope :alternatives, -> { joins(:section).where.not('sections.variation = 0') }

  after_save :update_section

  def update_section
    section.recalculate_information
  end

  def title
    "#{start} - #{finish}"
  end

  def proper_order_order
    unless proper_order_kept?
      errors.add(:section_order, 'add subsections in proper order within section')
    end
  end

  private

  def proper_order_kept?
    first_one_is_zero? || next_ones_are_following?
  end

  def first_one_is_zero?
    section_order.zero? && section&.subsections.blank?
  end

  def next_ones_are_following?
    return false unless section

    section.reload.subsections.present? &&
      section_order == section.subsections.map(&:section_order).max + 1
  end
end
