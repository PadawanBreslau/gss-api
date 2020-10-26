class CreateUtilities < ActiveRecord::Migration[6.0]
  def change
    create_table :utilities do |t|
      t.string :name, null: false
      t.jsonb :information
      t.references :gps_location, null: false, foreign_key: true
      t.references :location, foreign_key: true
      t.integer :utility_type

      t.timestamps
    end
  end
end
