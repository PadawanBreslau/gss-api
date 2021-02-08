Trestle.resource(:trivium) do
  menu do
    item :trivia, icon: 'fa fa-star'
  end

  form dialog: true do
    text_field :content
    select :triviable_type, %w(Section Subsection Location Utility Mezoregion Macroregion)
    text_field :triviable_id

    select :gps_location_id,
           [nil] + GpsLocation.all.map { |gps_location| [gps_location.to_s, gps_location.id] },
           label: 'Gps Location'
  end
end
