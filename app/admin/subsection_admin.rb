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
    row do
      col {  text_field :start }
      col { text_field :finish }
    end

    row do
      col(sm:12) { text_area :description, rows: 12 }
    end

    select :section_id, Section.all.map { |section| [section.title, section.id] }, label: 'Section'
    number_field :section_order

    row do
      col(sm: 3) { text_field :length, label: 'Lenght in km' }
      col(sm: 3) { number_field :ascent, label: 'Ascent in m' }
      col(sm: 3) { number_field :descent, label: 'Descent in m' }
    end

    row do
      col { text_field :mt_uuid, label: 'Id of saved Mapa Turystyczna map' }
      col { check_box :horizontal_map, label: 'Is map rather horizontal?' }
    end
  end
end
