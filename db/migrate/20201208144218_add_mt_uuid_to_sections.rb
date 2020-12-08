class AddMtUuidToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :mt_uuid, :string
  end
end
