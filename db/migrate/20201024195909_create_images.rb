class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :imagable, polymorphic: true, index: true, null: false

      t.jsonb :information
      t.timestamps
    end
  end
end
