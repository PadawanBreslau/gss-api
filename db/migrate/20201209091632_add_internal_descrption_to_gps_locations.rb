class AddInternalDescrptionToGpsLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :gps_locations, :internal_description, :string
  end
end
