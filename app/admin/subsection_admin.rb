Trestle.resource(:subsection) do
  scope :main, default: true
  scope :alternatives

  Section.pluck(:id).each do |section_id|
    scope "section_#{section_id}".to_sym
  end

  search do |query|
    if query
      Subsection.where('subsections.start ILIKE ? OR subsections.finish ILIKE ?',
                       "%#{query}%", "%#{query}%")
    else
      Subsection.all
    end
  end

  menu do
    item :subsections, icon: 'fa fa-star'
  end

  form dialog: true do
    text_field :start
    text_field :finish
    text_area :description
    number_field :section_order
    text_field :length, label: 'Lenght in km'
    number_field :ascent, label: 'Ascent in m'
    number_field :descent, label: 'Descent in m'
    text_field :mt_uuid, label: 'Id of saved Mapa Turystyczna map'
    check_box :horizontal_map, label: 'Is map rather horizontal?'
    # select :track_color, Subsection.track_colors.keys.map { |color| [color.humanize, color] }
    select :section_id, Section.all.map { |section| [section.title, section.id] }, label: 'Section'
  end
end
