class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :start, null: false
      t.string :finish, null: false
      t.text :description
      t.integer :order, null: false
      t.integer :variation, null: false

      t.timestamps
    end
  end
end
