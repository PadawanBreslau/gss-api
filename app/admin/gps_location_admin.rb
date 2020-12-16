Trestle.resource(:gps_location) do
  extend Utils

  Mezoregion.pluck(:name).each do |name|
    scope normalize(name)
  end

  menu do
    item :gps_locations, icon: 'fa fa-star'
  end

  return_to do
    gps_location_admin_index_path
  end
end
