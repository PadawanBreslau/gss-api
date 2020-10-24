class Macroregion < ApplicationRecord
  has_many :mezoregions
  has_many :trivia, as: :triviable
end
