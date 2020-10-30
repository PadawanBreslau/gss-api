class AddHorizontalAndMtUuidToSubsections < ActiveRecord::Migration[6.0]
  def change
    add_column :subsections, :horizontal_map, :boolean
    add_column :subsections, :mt_uuid, :string
  end
end
