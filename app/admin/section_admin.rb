Trestle.resource(:section) do
  menu do
    item :sections, icon: 'fa fa-star'
  end

  form do |_section|
    text_field :start
    text_field :finish
    text_area :description
    text_field :mt_uuid, label: 'Id of saved Mapa Turystyczna map'
    number_field :order
    select :variation, Section.variations.keys.map { |variation| [variation.humanize, variation] }
  end
end
