class AddGpsLocationToTrivia < ActiveRecord::Migration[6.0]
  def change
    add_reference :trivia, :gps_location, null: true
  end
end
