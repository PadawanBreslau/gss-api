class CreateGpsLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :gps_locations do |t|
      t.float :lat, null: false
      t.float :lon, null: false
      t.references :mezoregion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
