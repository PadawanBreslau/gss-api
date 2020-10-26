class Section < ApplicationRecord
  has_many :subsections
  has_many :trivia, as: :triviable
  has_many :images, as: :imagable
  validates :start, :finish, :order, :variation, presence: true
  validates :order, uniqueness: { scope: [:variation] }

  enum variation: [:main, :first_alternative, :second_alternative]

  def title
    "#{start} - #{finish}"
  end
end
