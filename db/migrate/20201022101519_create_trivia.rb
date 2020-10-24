class CreateTrivia < ActiveRecord::Migration[6.0]
  def change
    create_table :trivia do |t|
      t.text :content
      t.references :triviable, polymorphic: true, index: true, null: false

      t.timestamps
    end
  end
end
