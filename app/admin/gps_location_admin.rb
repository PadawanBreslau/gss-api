Trestle.resource(:gps_location) do
  extend Utils
  Mezoregion.pluck(:name).each do |name|
    scope normalize(name)
  end

  menu do
    item :gps_locations, icon: 'fa fa-star'
  end
end
