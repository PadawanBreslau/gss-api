Trestle.resource(:subsection) do
  menu do
    item :subsections, icon: 'fa fa-star'
  end

  form do |_subsection|
    text_area :description
    number_field :section_order
    select :track_color, Subsection.track_colors.keys.map { |color| [color.humanize, color] }
    select :section, Section.all.map { |section| [section.title, section] }
  end
end
