Trestle.resource(:utility) do
  menu do
    item :utilities, icon: 'fa fa-star'
  end

  form do
    text_field :name
    text_field :address
    text_field :phone_number
    text_field :website

    select :utility_type, Utility.utility_types.keys
                                 .map { |u_type| [u_type.humanize, u_type] }
    select :subsection_id,
           Subsection.all.map { |subsection| [subsection.title, subsection.id] },
           label: 'Subsection'
    select :location_id,
           Location.all.map { |location| [location.name, location.id] }, label: 'Location'
    select :gps_location_id,
      GpsLocation.all.map { |gps_location| gps_location.internal_description || [gps_location.to_s, gps_location.id] },
           label: 'Gps Location'
  end
end
