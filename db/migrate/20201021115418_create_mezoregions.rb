class CreateMezoregions < ActiveRecord::Migration[6.0]
  def change
    create_table :mezoregions do |t|
      t.string :name, null: false
      t.references :macroregion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
