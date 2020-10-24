class Trivium < ApplicationRecord
  belongs_to :triviable, polymorphic: true
end
