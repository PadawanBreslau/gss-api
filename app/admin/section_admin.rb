Trestle.resource(:section) do
  scope :main, default: true
  scope :alternatives

  search do |query|
    if query
      Section.where('start ILIKE ? OR finish ILIKE ?', "%#{query}%", "%#{query}%")
    else
      Section.all
    end
  end

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
