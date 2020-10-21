class Section < ApplicationRecord
  has_many :subsections
  validates :start, :finish, :order, :variation, presence: true
  validates :order, uniqueness: { scope: [:variation] }
end
