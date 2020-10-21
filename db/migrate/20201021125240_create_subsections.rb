class CreateSubsections < ActiveRecord::Migration[6.0]
  def change
    create_table :subsections do |t|
      t.text :description
      t.integer :track_color
      t.jsonb :information
      t.integer :section_order, null: false
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
