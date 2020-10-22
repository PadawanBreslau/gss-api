class Section < ApplicationRecord
  has_many :subsections
  validates :start, :finish, :order, :variation, presence: true
  validates :order, uniqueness: { scope: [:variation] }

  enum variation: [:main, :first_alternative, :second_alternative]

  def title
    "#{start} - #{finish}"
  end
end
