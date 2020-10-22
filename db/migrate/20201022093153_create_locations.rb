class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :attraction, default: false
      t.references :subsection, null: false, foreign_key: true
      t.references :gps_location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
