class Section < ApplicationRecord
  default_scope { order(order: :asc) }
  has_many :subsections
  has_many :locations, through: :subsections
  has_many :utilities, through: :subsections
  has_many :trivia, as: :triviable
  has_many :images, as: :imagable
  validates :start, :finish, :order, :variation, presence: true
  validates :order, uniqueness: { scope: [:variation] }

  enum variation: [:main, :first_alternative, :second_alternative]

  def title
    "#{start} - #{finish}"
  end

  def length
    subsections&.sum { |subs| subs.length.to_f }
  end

  def total_length
    Section.where(variation: variation).where('sections.order <= ?', order)
           .map(&:length).inject(:+).round(1)
  end

  def ascent
    subsections&.sum { |subs| subs.ascent.to_i }
  end

  def descent
    subsections&.sum { |subs| subs.descent.to_i }
  end
end
