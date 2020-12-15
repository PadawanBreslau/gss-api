class AddInformationToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :information, :jsonb
  end
end
